//
//  Main.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

//import SwiftUI
//import FirebaseAuth
//
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

//struct Main_Previews: PreviewProvider {
//    static var previews: some View {
//        Main()
//    }
//}


import SwiftUI
import FirebaseAuth

struct Main: View {


    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()

    var body: some View {
        ScrollView{

            VStack{
                ForEach(self.profileService.posts, id:\.postId ) {
                    (post) in

                    PostCardImage(post: post)
                    PostCard(post: post)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear{
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
    }
    }
}

