//
//  Notifications.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SDWebImageSwiftUI

//struct Notifications: View {
//
//    @ObservedObject var observedData = getPost()
//    @EnvironmentObject var session: SessionStore
//    @StateObject var profileService = ProfileService()
//
//    var body: some View {
//        ScrollView{
//
//            VStack{
//                ForEach(observedData.datas) {
//                    (post) in
//
//                    PostCardImage(post: post)
//                    PostCard(post: post)
//                }
//            }
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//        .onAppear{
//            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
//    }
//    }
//}
//
//struct PostsModel: Identifiable {
//    var id: ObjectIdentifier
//
//
//    var caption: String
//    var likes: [String: Bool]
//    var geoLocation: String
//    var ownerId: String
//    var postId: String
//    var username: String
//    var profile: String
//    var mediaUrl: String
//    var date: Double
//    var likeCount: Int
//
//
//}
//
//class getPost : ObservableObject{
//
//    @Published var datas = [PostsModel]()
//
//
//
//    init() {
//
//            let db = Firestore.firestore()
//
//        db.collection("following").getDocuments { (snap, err) in
//
//                if err != nil{
//
//                    print((err?.localizedDescription)!)
//                    return
//                }
//
//                for i in snap!.documentChanges{
//
//                    if i.type == .added{
//
//                        let id = i.document.documentID
//                        let caption = i.document.data()["caption"] as! String
//                        let likes = i.document.data()["likes"] as! [String : Bool]
//                        let geoLocation = i.document.data()["geoLocation"] as! String
//                        let ownerId = i.document.data()["ownerId"] as! String
//                        let postId = i.document.data()["postId"] as! String
//                        let username = i.document.data()["username"] as! String
//                        let profile = i.document.data()["profile"] as! String
//                        let mediaUrl = i.document.data()["mediaurl"] as! String
//                        let data = i.document.data()["data"] as! Double
//                        let likecount = i.document.data()["caption"] as! Int
//
//                        DispatchQueue.main.async {
//
//                            self.datas.append(PostsModel(id: i.document.documentID, caption: caption, likes: likes, geoLocation: geoLocation, ownerId: ownerId, postId: postId, username: username, profile: profile, mediaUrl: mediaUrl, date: data, likeCount: likecount))
//                        }
//                    }
//                }
//            }
//
//    }
//}
//
////var caption: String
////var likes: [String: Bool]
////var geoLocation: String
////var ownerId: String
////var postId: String
////var username: String
////var profile: String
////var mediaUrl: String
////var date: Double
////var likeCount: Int
//
//
//class AllPostModel: Encodable, Decodable, Identifiable {
//
//    var caption: String
//    var likes: [String: Bool]
//    var geoLocation: String
//    var ownerId: String
//    var postId: String
//    var username: String
//    var profile: String
//    var mediaUrl: String
//    var date: Double
//    var likeCount: Int
//
//
//}

//var caption: String
//var likes: [String: Bool]
//var geoLocation: String
//var ownerId: String
//var postId: String
//var username: String
//var profile: String
//var mediaUrl: String
//var date: Double
//var likeCount: Int


//class getDatas : ObservableObject{
//
//    @Published var datas = [AllPostModel]()
//
//
//
//    init() {
//
//            let db = Firestore.firestore()
//
//        db.collectionGroup("posts").getDocuments { (snap, err) in
//
//                if err != nil{
//
//                    print((err?.localizedDescription)!)
//                    return
//                }
//
//                for i in snap!.documentChanges{
//
//                    if i.type == .added{
//
//                        let caption = i.document.get("caption") as! String
//                        let likes = i.document.get("likes") as! String
//                        let geoLocation = i.document.get("geoLocation") as! String
//                        let ownerId = i.document.get("ownerId") as! String
//                        let postId = i.document.get("postId") as! String
//                        let username = i.document.get("username") as! String
//                        let profile = i.document.get("profile") as! String
//                        let mediaUrl = i.document.get("mediaUrl") as! String
//                        let date = i.document.get("date") as! Double
//                        let likeCount = i.document.get("likeCount") as! Int
//
//                        DispatchQueue.main.async {
//
//                            self.datas.append(datatype(caption: caption, li))
//                        }
//                    }
//                }
//            }
//
//    }
//}

import SwiftUI
import FirebaseAuth

struct Notifications: View {

    @EnvironmentObject var session: SessionStore
   // @StateObject var profileService = ProfileService()
    @StateObject var postMainService = PostMainService()
  //  @StateObject var postServiceClone = PostServiceClone()
  
    var body: some View {
        ScrollView{

            VStack{
                ForEach(self.postMainService.posts, id:\.postId ) {
                    (post) in

                    PostCardImage(post: post)
                    PostCard(post: post)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear{
            self.postMainService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
    }
    }
}

//Auth.auth().currentUser!.uid



struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}

//self.postMainService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
//userId: Auth.auth().currentUser!.uid


//PostMainService.loadUserPosts(userId: Auth.auth().currentUser!.uid, onSuccess: ([PostModel]) -> Void)
