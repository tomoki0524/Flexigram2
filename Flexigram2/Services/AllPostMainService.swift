//
//  AllPostMainService.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/10.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI


class AllPostMainService: ObservableObject{
    
  //  @Published var posts: [PostModel] = []

    static var Posts = AuthService.storeRoot.collection("posts")

   // static var AllPosts = AuthService.storeRoot.collection("allPosts")
   // static var Timeline = AuthService.storeRoot.collection("timeline")

//    static func PostsUser() -> DocumentReference {
//        return Posts.document()
//    }

    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }

    static func loadUserPost(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {
    

//    init() {
        
     //   let db = Firestore.firestore()
        
      //  db.collection("following").document(Auth.auth().currentUser!.uid).collection("following").getDocuments { (snap, err) in
        
      //  db.collection("posts").getDocuments { (snapshot, err) in "L7498vKmdSe6bKP37t4uL1jZ2Rp2"

     //   AllPostMainService.PostsUserId(userId: userId).collection("posts").getDocuments{
        AllPostMainService.PostsUserId(userId: userId).collection("posts").getDocuments{
            
// searchserviceのfirebaseの呼び出しのやつを使ってみるuserIdを入力する必要が無い           AuthService.storeRoot.collection("users").whereField("searchName", arrayContains: input.lowercased().removeWhiteSpace()).getDocuments {

        (snaps, error) in

            guard let snap = snaps else {
                print("Error")
                return
            }

            var posts = [PostModel]()

            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? PostModel.init(fromDictionary: dict)

                else {
                    return
                }
                posts.append(decoder)
            }
            onSuccess(posts)
        }
    }
}


