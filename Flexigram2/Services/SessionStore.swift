//
//  SessionStore.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class SessionStore: ObservableObject {

    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet{self.didChange.send(self)} }
    var handle: AuthStateDidChangeListenerHandle?

    func listen(){
        handle = Auth.auth().addStateDidChangeListener({
            (auth, user) in

            if let user = user{

                let firestoreUserId = AuthService.getUserId(userId: user.uid)
                firestoreUserId.getDocument{
                    (document, error) in
                    if let dict = document?.data(){
                        guard let decodeUser = try? User.init(fromDictionary: dict) else {return}
                        self.session = decodeUser
                    }
                }
            }
            else {
                self.session = nil
            }
        })

    }

    func logout() {
        do{
            try Auth.auth().signOut()
        } catch{

        }
    }

    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    deinit {
        unbind()
    }
}

