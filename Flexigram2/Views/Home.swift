//
//  TagHome.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/10/26.
//

import SwiftUI

struct Home: View {
    
    @State var text: String = ""
    
    // Tags....
    @State var tags: [Tag] = []
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack{
            
//            Text("Filter \nMenu")
//                .font(.system(size: 35, weight: .bold))
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity,alignment: .leading)
//
            // Custom Tag View...
            TagView(maxLimit: 150, tags: $tags)
            // Default Height....
                .frame(height: 280)
                .padding(.top,20)
            
            
            TextField("職業のタグを設定する", text: $text)
                .font(.title3)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(

                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder((Color.black).opacity(0.2),lineWidth: 8)
                )
                .background(Color.blue)
            // Setting only TextField....
                .environment(\.colorScheme, .dark)
                .padding(.vertical,18)

            // Add Button....
            Button {

                addTag(tags: tags, text: text, fontSize: 16, maxLimit: 150) {
                    alert, tag in

                    if alert{

                        showAlert.toggle()

                    }
                    else{
                        // adding Tag...
                        tags.append(tag)
                        text = ""
                    }
                }

            } label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical,12)
                    .padding(.horizontal,45)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            // Disabling Button...
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }
//        .padding(15)
//        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
//        .background(
//
//            Color.blue
//        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Tag Limit Exceeded try to delete some tags !!"), dismissButton: .destructive(Text("OK")))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

