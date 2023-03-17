//
//  AuthService.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthService {

    static var storeRoot = Firestore.firestore()

    static func getUserId(userId: String) -> DocumentReference {
        return storeRoot.collection("users").document(userId)
        // storeRoot.collection("posts").document(userId)
    }
    
//    static func UserId(userId: String) -> DocumentReference {
//        return storeRoot.collection("userss").document(userId)
//    }
//
//        static func TagsUserId(userId: String) -> DocumentReference {
//            return Tags.document(userId)
//        }

    static func signUp(username:String, email: String, password:String, imageData: Data, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (authData, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            guard let userId = authData?.user.uid else {return}

            let storageProfileUserId = StorageService.storageProfile(userId: userId)

            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"

            StorageService.saveProfileImage(userId: userId, username: username, email: email, imageData: imageData, metaData: metadata,  storageProfileImageRef: storageProfileUserId, onSuccess: onSucces, onError: onError)
        }
    }
    
//    static func uploadPosts(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
//
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let postId = PostService.PostsUserId(userId: userId).collection("tags").document().documentID
//
//        let storagePostRef = StorageService.storagePostId(postId: postId)
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        StorageService.savePostsPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
//
//
//    }

    static func signIn(email:String, password:String, onSucces: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {

        Auth.auth().signIn(withEmail: email, password: password) {
            (authData, error) in

            if error != nil {
                onError(error!.localizedDescription)
                return
            }

            guard let userId = authData?.user.uid else {return}

            let firestoreUserId = getUserId(userId: userId)
          //  let firestoreUserId = UserId(userId: userId)

            firestoreUserId.getDocument{
                (document, error) in
                if let dict = document?.data() {
                    guard let decodedUser = try? User.init(fromDictionary: dict) else {return}

                    onSucces(decodedUser)
                }

            }

        }
    }
}
