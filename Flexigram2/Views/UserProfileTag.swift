//
//  UserProfileTag.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/23.
//
//
//import SwiftUI
//import SDWebImageSwiftUI
//
//struct UserProfileTag: View {
//
//    @State private var value: String = ""
//    @State var user: [User] = []
//    @State var isLoading = false
//
//    func searchUsers(){
//        isLoading = true
//
//        SearchServiceClone.searchUser(input: value) {
//            (users) in
//
//            self.isLoading = false
//            self.user = user
//        }
//
//    }
//
//    var body: some View {
//        ScrollView{
//            VStack(alignment: .leading){
//
//                SearchBarClone(value: $value).padding()
//                    .onChange(of: value, perform: {
//                        new in
//
//                        searchUsers()
//                    })
//
//                if !isLoading {
//                    ForEach(user, id:\.uid) {
//
//                        user in
//
//                        NavigationLink(destination: UserProfileView(user: users)) {
//
//                        HStack{
//                            WebImage(url: URL(string: username.profile)!)
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(Circle())
//                                .frame(width: 60, height: 60, alignment: .trailing)
//                                .padding()
//
//                            Text(username.username).font(.subheadline).bold()
//
//                           // Divider().background(Color.black)
//                        }
//
//                    }
//                    }
//                }
//
//            }
//        }.navigationTitle("User Search")
//    }
//}
//

//import SwiftUI
//import SDWebImageSwiftUI
//
//struct UserProfileTag: View {
//
//    @State private var value: String = ""
//    @State var users: [User] = []
//    @State var isLoading = false
//
//    func searchUsers(){
//        isLoading = true
//
//        SearchServiceClone.searchUser(input: value) {
//            (users) in
//
//            self.isLoading = false
//            self.users = users
//        }
//
//    }
//
//    var body: some View {
//        ScrollView{
//            VStack(alignment: .leading){
//
//                SearchBar(value: $value).padding()
//                    .onChange(of: value, perform: {
//                        new in
//
//                        searchUsers()
//                    })
//
//                if !isLoading {
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
//                }
//
//            }
//        }.navigationTitle("User Search")
//    }
//}
//


import SwiftUI
import SDWebImageSwiftUI

struct UserProfileTag: View {
    @State private var value: String = ""
    @State var users: [User] = []
  //  @State var user: [User] = []
  //  @State var user: [User] = []
    @State var isLoading = false

    func searchUsers(){
        isLoading = true

        SearchServiceClone.searchUser(input: value) {
            (users) in

            self.isLoading = false
            self.users = users
        }

    }

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){

                SearchBar(value: $value).padding()
                    .onChange(of: value, perform: {
                        new in

                        searchUsers()
                    })
                
                if !isLoading {
                    ForEach(users, id:\.uid) {

                        user in

                    //    NavigationLink(destination: UserProfileTagView(users: user, user: user)){
                        NavigationLink(destination: UserProfileTagView(user: user)){
                        HStack{
                            WebImage(url: URL(string: user.profileImageUrl)!)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60, alignment: .trailing)
                                .padding()

                            Text(user.username).font(.subheadline).bold()

                           // Divider().background(Color.black)
                        }
                        
                    }
                  }

                }

            }
        }.navigationTitle("User Search")
    }
}


