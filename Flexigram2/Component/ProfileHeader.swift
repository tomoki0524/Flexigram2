//
//  ProfileHeader.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import SwiftUI
import SDWebImageSwiftUI
//
//struct ProfileHeader: View {
//    var user: User?
//    var postsCount: Int
//    @Binding var following: Int
//    @Binding var followers: Int
//
//    var body: some View {
//        HStack{
//        VStack{
//            if user != nil {
//                WebImage(url: URL(string: user!.profileImageUrl)!)
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(Circle())
//                    .frame(width: 100, height: 100, alignment: .trailing)
//                    .padding(.leading)
//            } else{
//                Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 100, height: 100, alignment: .trailing)
//                    .padding(.leading)
//
//            }
//            Text(user!.username).font(.headline).bold().padding(.leading)
//
//
//        }
//        VStack{
//            HStack{
//                Spacer()
//                VStack{
//                    Text("posts").font(.footnote)
//                    Text("\(postsCount)").font(.title).bold()
//                }.padding(.top, 60)
//
//                Spacer()
//                VStack{
//                    Text("Followers").font(.footnote)
//                    Text("\(followers)").font(.title).bold()
//                }.padding(.top, 60)
//                Spacer()
//                VStack{
//                    Text("Following").font(.footnote)
//                    Text("20").font(.title).bold()
//                }.padding(.top, 60)
//                Spacer()
//            }
//
//        }
//        }
//    }
//}

//import SwiftUI
//import SDWebImageSwiftUI
//
//struct ProfileHeader: View {
//    var user: User?
//    var postsCount: Int
//    @Binding var following: Int
//    @Binding var followers: Int
//
//    var body: some View {
//
//        HStack{
//        VStack{
//            if user != nil {
//                WebImage(url: URL(string: user!.profileImageUrl)!)
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(Circle())
//                    .frame(width: 100, height: 100, alignment: .trailing)
//                    .padding(.leading)
//                Text(user!.username).font(.headline).bold().padding(.leading)
//
//            } else {
//                Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 100, height: 100, alignment: .trailing)
//                    .padding(.leading)
//            }
//
//
//        }
//        VStack{
//            HStack{
//
//                VStack{
//                    Text("職業")
//                }.padding()
//                    .frame(maxWidth: .in,alignment: .top)
//                    .background(
//
//                        Color.blue
//                    )
//                Spacer()
//                Spacer()
//                VStack{
//                    Text("Posts").font(.footnote)
//                    Text("\(postsCount)").font(.title).bold()
//                }.padding(.top, 150)
//
//                Spacer()
//                VStack{
//                    Text("Followers").font(.footnote)
//                    Text("\(followers)").font(.title).bold()
//                }.padding(.top, 150)
//                Spacer()
//                VStack{
//                    Text("Following").font(.footnote)
//                    Text("\(following)").font(.title).bold()
//                }.padding(.top, 150)
//                Spacer()
//            }
//        }
//        }
//    }
//}

//struct ProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeader()
//    }
//}


struct ProfileHeader: View{
    var user: User?
    var postsCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    
    var body: some View {
        HStack{
        VStack{
            if user != nil{
                WebImage(url: URL(string: user!.profileImageUrl)!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
                Text(user!.username).font(.headline).bold().padding(.leading)
                
            } else {
                Color.init(red: 0.9, green: 0.9, blue: 0.9) .frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
            }
            
            
        }
        VStack{
            
        
                VStack{
                    
                   Home()


                } //.frame(width: UIScreen.main.bounds.width - 80,alignment: .leading)
//                        .padding(.vertical)
//                        .padding(.bottom,20)
//            }.frame(width: 250, height: 80, alignment: .trailing)
//                .padding(.top)
//                .background(
//
//                    RoundedRectangle(cornerRadius: 8)
//                        .strokeBorder((Color.blue).opacity(0.15),lineWidth: 1)
//                )

            HStack{
                
               
                                Spacer()
                                Spacer()
                                VStack{
                                    Text("Posts").font(.footnote)
                                    Text("\(postsCount)").font(.title).bold()
                                }.padding(.top, 150)


                                Spacer()
                                VStack{
                                    Text("Followers").font(.footnote)
                                    NavigationLink(destination: Followers_Header()){
                                    Text("\(followers)").font(.title).bold()
                                    }.foregroundColor(.black)
                                }.padding(.top, 150)
                                Spacer()
                                VStack{
                                    Text("Following").font(.footnote)
                                    NavigationLink(destination: Following_Header()){
                                    Text("\(following)").font(.title).bold()
                                    }.foregroundColor(.black)
                                }.padding(.top, 150)
                                Spacer()
            }
        }
        }
    }
}


//NavigationLink(destination: Usage_treaty()){
//Text("利用規約").font(.system(size: 20, weight: .semibold))
//    .foregroundColor(.blue)
//}




//                ScrollView{//(.vertical, showsIndicators: false) {
//
//                    VStack{//(alignment: .leading, spacing: 10) {
//
//                        // Displaying Tags...
//
////                        ForEach(getRows(),id: \.self){rows in
////
////                            HStack(spacing: 6){
////
////                                ForEach(rows){row in
////
////                                   RowView(tag: row)
////                                }
////                            }
////                        }
//
//                    }
//                    .frame(width: UIScreen.main.bounds.width - 20,alignment: .leading)
//                    .padding(.vertical)
////                    .padding(.bottom,20)
//                }
//                .frame(maxWidth: .infinity)
//                .background(
//
//                    RoundedRectangle(cornerRadius: 8)
//                        .strokeBorder((Color.blue).opacity(0.15),lineWidth: 1)
//                )
                
