//
//  Following Header.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/11/02.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SDWebImageSwiftUI



struct Following_Header: View {

    @ObservedObject var observedData = getData()
//    @StateObject var profileService = ProfileService()
    @ObservedObject var profileService = ProfileService()
    @EnvironmentObject var session: SessionStore

    var body: some View {

        NavigationView{

            ZStack{

                  
                List(observedData.datas){i in
                    
                    Text("\(i.username)")
                }

//                List(self.profileService.following, ){i in
//
//                    Text("\(i.username)")
    
                    
//                    ForEach(self.profileService.posts, id:\.postId ) {
//                        (post) in
//
//                        PostCardImage(post: post)
//                        PostCard(post: post)
//                    }
//
             //       self.profileService.posts, id:\.postId
                    
//
//                    ForEach(users, id:\.uid) {
//
//                        user in
//
//                        NavigationLink(destination: UserProfileView(user: user)) {
//
//                        HStack{
//                            WebImage(url: URL(string: user.profileImageUrl)!)
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(Circle())
//                                .frame(width: 60, height: 60, alignment: .trailing)
//                                .padding()
//
//                            Text(user.username).font(.subheadline).bold()
//
//                           // Divider().background(Color.black)
//                        }
//
//                    }
//                    }

                
            }
        }
       // .navigationTitle("")
      //  .navigationBarHidden(true)
//        .onAppear{
//            self.profileService.follows(userId: Auth.auth().currentUser!.uid)
//    }
    }
}


struct datatype : Identifiable {
    var id: String
    var username : String
}

class getData : ObservableObject{

    @Published var datas = [datatype]()



    init() {

            let db = Firestore.firestore()

        db.collection("following").document(Auth.auth().currentUser!.uid).collection("following").getDocuments { (snap, err) in

                if err != nil{

                    print((err?.localizedDescription)!)
                    return
                }

                for i in snap!.documentChanges{

                    if i.type == .added{

                        let id = i.document.documentID
                        let username = i.document.documentID

                        DispatchQueue.main.async {

                            self.datas.append(datatype(id: id, username: username))
                        }
                    }
                }
            }

    }
}

//



// PostService.PostsUserId(userId: userId).collection("posts").getDocuments{











//class getData: ObservableObject {
//
//    @Published var posts: [PostModel] = []
//    @Published var following = 0
//    @Published var followers = 0
//
//    @Published var followCheck = false
//
//    static var following = AuthService.storeRoot.collection("following")
//    static func followingCollection(userid: String) -> CollectionReference{
//
//        return following.document(userid).collection("following")
//    }
//
//    static func followingId(userId: String) -> DocumentReference {
//
//        return following.document(Auth.auth().currentUser!.uid).collection("following").document(userId)
//    }
//
//    func followState(userid: String) {
//        ProfileService.followingId(userId: userid).getDocument {
//            (document, error) in
//
//            if let doc = document, doc.exists {
//                self.followCheck = true
//            } else {
//                self.followCheck = false
//            }
//        }
//
//    }
//
//    func follows(userId: String) {
//
//        ProfileService.followingCollection(userid: userId).getDocuments {
//           (querysnapshot, err) in
//
//            if let doc = querysnapshot?.documents {
//                self.following = doc.count
//            }
//        }
//    }
//}

struct Following_Header_Previews: PreviewProvider {
    static var previews: some View {
        Following_Header()
    }
}



//struct Main: View {
//
//    @EnvironmentObject var session: SessionStore
//    @StateObject var profileService = ProfileService()
//
//    var body: some View {
//        ScrollView{
//
//            VStack{
//                ForEach(self.profileService.posts, id:\.postId ) {
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
//    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping()-> Void, onError: @escaping (_ errorMessage: String) -> Void) {
//
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
//
//        let storagePostRef = StorageService.storagePostId(postId: postId)
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostRef, onSuccess: onSuccess, onError: onError)
//    }
//}













