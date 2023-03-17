//
//  PostService.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI



class PostService {

    static var storeRoot = Firestore.firestore()

//    static func getUserId(userId: String) -> DocumentReference {
//        return storeRoot.collection("posts").document(userId)
//    }


    static var Posts = AuthService.storeRoot.collection("posts")

  //  static var Postss = AuthService.storeRoot.collection("Postss")

    static var AllPosts = AuthService.storeRoot.collection("allPosts")
    static var AllTags = AuthService.storeRoot.collection("allTags")
    static var Timeline = AuthService.storeRoot.collection("timeline")

    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }

//    static func TagsUserId(userId: String) -> DocumentReference {
//        return AllTags.document(userId)
//    }

    static func timelineUserId(userId: String) -> DocumentReference {
        return Timeline.document(userId)
    }

  //  // 投稿ボタンを押してポストのデータがfirebaseに保管されるためのコード

    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {

        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID

        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)


    }

    static func uploadPosts(email: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {

        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let postId = PostService.PostsUserId(userId: userId).collection("tags").document().documentID

        let storagePostRef = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        StorageService.savePostsPhoto(userId: userId, email: email, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
    }
    //

    static func loadPost(postId: String, onSuccess: @escaping(_ post: PostModel)-> Void){

        PostService.AllPosts.document(postId).getDocument {

            (snapshot, err) in

            guard let snap = snapshot else {
                print("Error")
                return
            }

            let dict = snap.data()

            guard let decoded = try? PostModel.init(fromDictionary: dict!)
            else {
                return
            }
            onSuccess(decoded)
        }


    }

    static func loadPosts(postId: String, onSuccess: @escaping(_ post: PostModel)-> Void){

        PostService.AllTags.document(postId).getDocument {

            (snapshot, err) in

            guard let snap = snapshot else {
                print("Error")
                return
            }

            let dict = snap.data()

            guard let decoded = try? PostModel.init(fromDictionary: dict!)
            else {
                return
            }
            onSuccess(decoded)
        }


    }
        // ここが怪しい


    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {

       // let db = Firestore.firestore()

      //  db.collection("following").document(Auth.auth().currentUser!.uid).collection("following").getDocuments { (snap, err) in

      //  db.collection("posts").getDocuments { (snapshot, err) in "L7498vKmdSe6bKP37t4uL1jZ2Rp2"

        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
        (snapshot, error) in

            guard let snap = snapshot else {
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











//import Foundation
//import FirebaseAuth
//import Firebase
//import FirebaseFirestore
//import FirebaseStorage
//
//class PostService {
//
//    static var Posts = AuthService.storeRoot.collection("posts")
//
//    static var AllPosts = AuthService.storeRoot.collection("allPosts")
//    static var Timeline = AuthService.storeRoot.collection("timeline")
//
//    static func PostsUserId(userId: String) -> DocumentReference {
//        return Posts.document(userId)
//    }
//
//    static func timelineUserId(userId: String) -> DocumentReference {
//        return Timeline.document(userId)
//    }
//
//    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
//
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let postId = PostService.PostsUserId(userId: userId).collection("post").document().documentID
//
//        let storagePostRef = StorageService.storagePostId(postId: postId)
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
//
//
//    }
//
//    static func loadPost(postId: String, onSuccess: @escaping(_ post: PostModel)-> Void){
//
//        PostService.AllPosts.document(postId).getDocument {
//
//            (snapshot, err) in
//
//            guard let snap = snapshot else {
//                print("Error")
//                return
//            }
//
//            let dict = snap.data()
//
//            guard let decoded = try? PostModel.init(fromDictionary: dict!)
//            else {
//                return
//            }
//            onSuccess(decoded)
//        }
//    }
//
//
//    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {
//
//        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
//        (snapshot, error) in
//
//            guard let snap = snapshot else {
//                print("Error")
//                return
//            }
//
//            var posts = [PostModel]()
//
//            for doc in snap.documents {
//                let dict = doc.data()
//                guard let decoder = try? PostModel.init(fromDictionary: dict)
//
//                else {
//                    return
//                }
//                posts.append(decoder)
//            }
//            onSuccess(posts)
//        }
//    }
//}
