//
//  Followers Header.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/11/02.
//
import SwiftUI
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SDWebImageSwiftUI


struct Followers_Header: View {
    @ObservedObject var observedData = getDatas()
//    @StateObject var profileService = ProfileService()
    @ObservedObject var profileService = ProfileService()
    @EnvironmentObject var session: SessionStore

    var body: some View {

        NavigationView{

            ZStack{

                  
                List(observedData.datas){i in
                    
                    Text("\(i.username)")
                }       
            }
        }
       // .navigationTitle("")
      //  .navigationBarHidden(true)
        .onAppear{
            self.profileService.follows(userId: Auth.auth().currentUser!.uid)
    }
    }
}

struct datatypes : Identifiable {
    var id: String
    var username : String
}

class getDatas : ObservableObject{

    @Published var datas = [datatypes]()



    init() {

            let db = Firestore.firestore()

        db.collection("followers").document(Auth.auth().currentUser!.uid).collection("followers").getDocuments { (snap, err) in

                if err != nil{

                    print((err?.localizedDescription)!)
                    return
                }

                for i in snap!.documentChanges{

                    if i.type == .added{

                        let id = i.document.documentID
                        let username = i.document.documentID

                        DispatchQueue.main.async {

                            self.datas.append(datatypes(id: id, username: username))
                        }
                    }
                }
            }

    }
}
