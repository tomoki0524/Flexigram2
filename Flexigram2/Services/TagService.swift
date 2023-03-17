//
//  TagService.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/02/05.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage
import SwiftUI


  
//class TagService {
//
//    static var storeRoot = Firestore.firestore()
//
////    static var Posts = AuthService.storeRoot.collection("posts")
//
//    static var Tags = AuthService.storeRoot.collection("Tags")
//
//    static var tags = AuthService.storeRoot.collection("tags")
//
//    static func getUserId(userId: String) -> DocumentReference {
//        return storeRoot.collection("Tags").document(userId)
//    }
//
////    static func getUserId(userId: String) -> DocumentReference {
////        return storeRoot.collection("users").document(userId)
////    }
////
//    static func TagsUserId(userId: String) -> DocumentReference {
//        return Tags.document(userId)
//    }
//
//    static func uploadPosts(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
//
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let postId = TagService.TagsUserId(userId: userId).collection("tags").document().documentID
//
//        let storagePostRef = StorageService.storagePostId(postId: postId)
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        StorageService.savePostsPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
//
//
//    }
//    //
//}


