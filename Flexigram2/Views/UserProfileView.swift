//
//  UserProfileView.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/17.
//


//import SwiftUI
//import SDWebImageSwiftUI
//
//struct UserProfileView: View {
//    var user: User
//
//    @StateObject var profileService = ProfileService()
//    @State private var selection = 0
//
//    let threeColums = [GridItem(), GridItem(), GridItem()]
//
//
//    var body: some View {
//
//        ScrollView{
//            ProfileHeader(user: user, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
//
//            HStack{
//
//                FollowButton(user: user, followCheck: $profileService.followCheck, followingCount: $profileService.following, followersCount: $profileService.followers)
//            }.padding(.horizontal)
//
//            Picker("", selection: $selection) {
//                Image(systemName: "circle.grid.cross.fill").tag(0)
//                Image(systemName: "person.circle").tag(1)
//            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
//
//            if selection == 0 {
//                LazyVGrid(columns: threeColums) {
//                    ForEach(self.profileService.posts, id:\.postId) {
//                        (post) in
//
//                        WebImage(url: URL(string: post.mediaUrl)!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3).clipped()
//                    }
//                }
//            } else {
//                ScrollView{
//
//                       VStack{
//                           ForEach(self.profileService.posts, id:\.postId ) {
//                               (post) in
//
//                              PostCardImage(post: post)
//                               PostCard(post: post)
//                           }
//                      }
//                }
//
//            }
//
//        }.navigationBarTitle(Text(self.user.username))
//        .onAppear{
//            self.profileService.loadUserPosts(userId: self.user.uid)
//        }
//}
//}
//
////struct UserProfileView_Previews: PreviewProvider {
////    static var previews: some View {
////        UserProfileView()
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////import SwiftUI
////import SDWebImageSwiftUI
////
////struct UserProfileView: View {
////    var user: User
////
////    @StateObject var profileService = ProfileService()
////    @State private var selection = 0
////
////    let threeColums = [GridItem(), GridItem(), GridItem()]
////
////
////    var body: some View {
////
////        ScrollView{
////            ProfileHeader(user: user, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
////
////            HStack{
////
////                FollowButton(user: user, followCheck: $profileService.followCheck, followingCount: $profileService.following, followersCount: $profileService.followers)
////            }.padding(.horizontal)
////
////
////            Picker("", selection: $selection) {
////                Image(systemName: "circle.grid.cross.fill").tag(0)
////                Image(systemName: "person.circle").tag(1)
////            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
////
////            if selection == 0 {
////                LazyVGrid(columns: threeColums) {
////                    ForEach(self.profileService.posts, id:\.postId) {
////                        (post) in
////
////                        WebImage(url: URL(string: post.mediaUrl)!)
////                            .resizable()
////                            .aspectRatio(contentMode: .fill)
////                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3).clipped()
////                    }
////                }
////            } else {
////                ScrollView{
////
////                       VStack{
////                           ForEach(self.profileService.posts, id:\.postId ) {
////                               (post) in
////
////                              PostCardImage(post: post)
////                               PostCard(post: post)
////                           }
////                      }
////                }
////
////            }
////
////        }.navigationBarTitle(Text(self.user.username))
////        .onAppear{
////            self.profileService.loadUserPosts(userId: self.user.uid)
////        }
////}
////}


import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    var user: User

    @StateObject var profileService = ProfileService()
    @State private var selection = 0

    let threeColums = [GridItem(), GridItem(), GridItem()]


    var body: some View {

        ScrollView{
            ProfileHeader(user: user, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)

            HStack{

                FollowButton(user: user, followCheck: $profileService.followCheck, followingCount: $profileService.following, followersCount: $profileService.followers)
            }.padding(.horizontal)

            Picker("", selection: $selection) {
                Image(systemName: "circle.grid.cross.fill").tag(0)
                Image(systemName: "person.circle").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

            if selection == 0 {
                LazyVGrid(columns: threeColums) {
                    ForEach(self.profileService.posts, id:\.postId) {
                        (post) in

                        WebImage(url: URL(string: post.mediaUrl)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3).clipped()
                    }
                }
            } else {
                ScrollView{

                       VStack{
                           ForEach(self.profileService.posts, id:\.postId ) {
                               (post) in

                              PostCardImage(post: post)
                               PostCard(post: post)
                           }
                      }
                }

            }

        }.navigationBarTitle(Text(self.user.username))
        .onAppear{
            self.profileService.loadUserPosts(userId: self.user.uid)
        }
}
}
