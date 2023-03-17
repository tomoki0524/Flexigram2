//
//  Profile.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

//import SwiftUI
//import FirebaseAuth
//import SDWebImageSwiftUI
//
//struct Profile: View {
//
//    @EnvironmentObject var session: SessionStore
//    @State private var selection = 1
//    @StateObject var profileService = ProfileService()
//    @State private var isLinkActive = false
//
//    let threeColums = [GridItem(), GridItem(), GridItem()]
//
//    func listen(){
//        session.listen()
//    }
//
//    var body: some View {
//
//        ScrollView{
//        VStack{
//
//            ProfileHeader(user: self.session.session, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
//
//            VStack(alignment: .leading){
//                Text(session.session?.bio ?? "").font(.headline).lineLimit(1)
//            }
//
//            NavigationLink(destination: EditProfile(session: self.session.session), isActive: $isLinkActive){
//            Button(action: {self.isLinkActive = true}){
//                Text("Edit Profile").font(.title).modifier(ButtonModifiers())
//            }.padding(.horizontal)
//            }
//            Picker("", selection: $selection) {
//                Image(systemName: "photo.on.rectangle").tag(0)
//                Image(systemName: "person.circle").tag(1)
//                Image(systemName: "rectangle.and.pencil.and.ellipsis").tag(2)
//                Image(systemName: "bolt.heart.fill").tag(3)
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
//            }
//            else
//            if (self.session.session == nil) { Text("")}
//            else {
//                ScrollView{
//                    VStack{
//                        ForEach(self.profileService.posts, id:\.postId){
//                            (post) in
//                            PostCardImage(post: post)
//                            PostCard(post: post)
//                        }
//                    }
//                }
//            }
//
//        }
//
//        }
//        .navigationTitle("Profile")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(leading: Button(action: {}){
//            NavigationLink(destination: UserProfile()){
//            Image(systemName: "person.fill.badge.plus")
//            }
//
//        }, trailing: Button(action: {
//            self.session.logout()
//        }){
//            Image(systemName: "arrow.right.circle.fill")
//        })
//        .onAppear{
//            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
//        }
//    }
//}
//
////struct Profile_Previews: PreviewProvider {
////    static var previews: some View {
////        Profile()
////    }
////}
//
//




import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI

struct Profile: View {

    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    @StateObject var profileService = ProfileService()
    @State private var isLinkActive = false

    let threeColums = [GridItem(), GridItem(), GridItem()]

    func listen(){
        session.listen()
    }

    var body: some View {

        ScrollView{
        VStack{

            ProfileHeader(user: self.session.session, postsCount: profileService.posts.count, following: $profileService.following, followers: $profileService.followers)
        
            VStack(alignment: .leading){
                Text(session.session?.bio ?? "").font(.headline).lineLimit(1)
            }

            NavigationLink(destination: EditProfile(session: self.session.session), isActive: $isLinkActive){
            Button(action: {self.isLinkActive = true}){
                Text("Edit Profile").font(.title).modifier(ButtonModifiers())
            }.padding(.horizontal)
            }
            Picker("", selection: $selection) {
                Image(systemName: "photo.on.rectangle").tag(0)
                Image(systemName: "person.circle").tag(1)
                Image(systemName: "rectangle.and.pencil.and.ellipsis").tag(2)
                Image(systemName: "bolt.heart.fill").tag(3)
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
            }
            else
            if (self.session.session == nil) { Text("")}
            else {
                ScrollView{
                    VStack{
                        ForEach(self.profileService.posts, id:\.postId){
                            (post) in
                            PostCardImage(post: post)
                            PostCard(post: post)
                        }
                    }
                }
            }

        }
        }.navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {}){
                NavigationLink(destination: UserProfile()){
                Image(systemName: "person.fill.badge.plus")
                }

            }, trailing: Button(action: {}){
                NavigationLink(destination: SignInView()){
                Image(systemName: "arrow.right.circle.fill")
                }
            })

       
        .onAppear{
            self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        }
    }
}


//NavigationLink(destination: Privacy_policy()){
//Text("プライバシーポリシー").font(.system(size: 20, weight: .semibold))
//    .foregroundColor(.blue)
//}
