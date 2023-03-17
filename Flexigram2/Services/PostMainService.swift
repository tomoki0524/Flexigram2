//
//  PostMainService.swift
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




class PostMainService: ObservableObject {
    
    @Published var posts: [PostModel] = []


//    func loadUserPosts(userId: String) {
//
//        PostService.loadUserPosts(userId: userId) { (posts) in
//
//            self.posts = posts
//        }
//
////        follows(userId: userId)
////        followers(userId: userId)
//    }
    
//    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [PostModel]) -> Void) {
//
//        let db = Firestore.firestore()
//
//      //  db.collection("following").document(Auth.auth().currentUser!.uid).collection("following").getDocuments { (snap, err) in
//
//      //  db.collection("posts").getDocuments { (snapshot, err) in "L7498vKmdSe6bKP37t4uL1jZ2Rp2"
//
//        db.collection("posts").getDocuments{
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
    
    func loadUserPosts(userId: String) {

        AllPostMainService.loadUserPost(userId: userId) { (posts) in

            self.posts = posts
        }

    //    follows(userId: userId)
    //    followers(userId: userId)
    }
}

