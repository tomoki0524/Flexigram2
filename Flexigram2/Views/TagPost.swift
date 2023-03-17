//
//  TabPost.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/02/02.
//
//
import SwiftUI


struct TagPost: View {


    @State private var postImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error:String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No 😱"
    @State private var text = ""


    func uploadPosts() {

        PostService.uploadPosts(email: text, imageData: imageData, onSuccess: {
            self.clear()
        }) {

            (errorMessage) in

            self.error = errorMessage
            self.showingAlert = true
            return
        }
        self.clear()

    }


    func clear(){
        self.text = ""
//        self.imageData = Data()
//        self.postImage = Image(systemName: "photo.fill")
    }

//    func errorCheck() -> String? {
//        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
//            password.trimmingCharacters(in: .whitespaces).isEmpty ||
//            username.trimmingCharacters(in: .whitespaces).isEmpty ||
//            imageData.isEmpty{
//
//            return "Please fill in all fields and provide an image"
//        }
//        return nil
//
//    }


    var body: some View {

        VStack{

            Text("Post").navigationBarTitleDisplayMode(.inline)

//            VStack{
//
//            if postImage != nil{
//                postImage!.resizable()
//                        .frame(width: 300, height: 200)
//                        .onTapGesture {
//                            self.showingActionSheet = true
//                        }
//            } else {
//                Image(systemName: "photo.fill")
//                    .resizable()
//                    .frame(width: 300, height: 200)
//                    .onTapGesture {
//                        self.showingActionSheet = true
//                    }
//            }
//            }

            TextEditor(text: $text)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
                .padding(.horizontal)

            Button(action: uploadPosts) {
                Text("Post").font(.title).modifier(ButtonModifiers())
            }
        }.navigationTitle("Post")
            .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}



//import SwiftUI
//
//
//struct Post: View {
//
//
//    @State private var postImage: Image?
//    @State private var pickedImage: Image?
//    @State private var showingActionSheet = false
//    @State private var showingImagePicker = false
//    @State private var imageData: Data = Data()
//    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
//    @State private var error:String = ""
//    @State private var showingAlert = false
// //   @State private var alertTitle: String = "Oh No 😱"
//    @State private var text = ""
//
//    func loadImage() {
//        guard let inputImage = pickedImage else {return}
//
//        postImage = inputImage
//    }
//
////    func uploadPost() {
////        if let error = errorCheck() {
////            self.error = error
////            self.showingAlert = true
////            self.clear()
////            return
////        }
////        // firebase....
////    }
//
//    func uploadPost() {
//
//        PostService.uploadPost(caption: text, imageData: imageData, onSuccess: {
//            self.clear()
//        }) {
//
//            (errorMessage) in
//
//            self.error = errorMessage
//            self.showingAlert = true
//            return
//        }
//     //   self.clear()
//
//    }
//
//    func clear(){
//        self.text = ""
//        self.imageData = Data()
//        self.postImage = Image(systemName: "photo.fill")
//    }
//
////    func errorCheck() -> String? {
////        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
////            password.trimmingCharacters(in: .whitespaces).isEmpty ||
////            username.trimmingCharacters(in: .whitespaces).isEmpty ||
////            imageData.isEmpty{
////
////            return "Please fill in all fields and provide an image"
////        }
////        return nil
////
////    }
//
//
//    var body: some View {
//
//        VStack{
//
//            Text("Post").navigationBarTitleDisplayMode(.inline)
//
//            VStack{
//
//            if postImage != nil{
//                postImage!.resizable()
//                        .frame(width: 300, height: 200)
//                        .onTapGesture {
//                            self.showingActionSheet = true
//                        }
//            } else {
//                Image(systemName: "photo.fill")
//                    .resizable()
//                    .frame(width: 300, height: 200)
//                    .onTapGesture {
//                        self.showingActionSheet = true
//                    }
//            }
//            }
//
//            TextEditor(text: $text)
//                .frame(height: 200)
//                .padding(4)
//                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
//                .padding(.horizontal)
//
//            Button(action: uploadPost) {
//                Text("Post").font(.title).modifier(ButtonModifiers())
//            }
//
//            // 選択された場合は画像を表示
////            if imageData.count != 0{
////
////                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
////
////                    Image(uiImage: UIImage(data: imageData)!)
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
////                        .cornerRadius(15)
////
////                    // キャンセルするボタン
////
////                    Button(action: {imageData = Data(count: 0)}) {
////
////                        Image(systemName: "xmark")
////                            .foregroundColor(.white)
////                            .padding(10)
////                            .background(Color("blue"))
////                            .clipShape(Circle())
////                    }
////                }
////                .padding()
////            }
//        }.navigationTitle("Post")
//            .navigationBarTitleDisplayMode(.inline)
//        .padding()
//            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//
//                ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
//            }.actionSheet(isPresented: $showingActionSheet) {
//                ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
//                    self.sourceType = .photoLibrary
//                    self.showingImagePicker = true
//                },
//                .default(Text("Take A Photo")){
//                    self.sourceType = .camera
//                    self.showingImagePicker = true
//
//                }, .cancel()
//                ])
//            }
//    }
//}
//




//import SwiftUI
//
//
//struct Post: View {
//
//
//    @State private var postImage: Image?
//    @State private var pickedImage: Image?
//    @State private var showingActionSheet = false
//    @State private var showingImagePicker = false
//    @State private var imageData: Data = Data()
//    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
//    @State private var error:String = ""
//    @State private var showingAlert = false
// //   @State private var alertTitle: String = "Oh No 😱"
//    @State private var text = ""
//
//    func loadImage() {
//        guard let inputImage = pickedImage else {return}
//
//        postImage = inputImage
//    }
//
////    func uploadPost() {
////        if let error = errorCheck() {
////            self.error = error
////            self.showingAlert = true
////            self.clear()
////            return
////        }
////        // firebase....
////    }
//
//    func uploadPost() {
//
//        PostService.uploadPost(caption: text, imageData: imageData, onSuccess: {
//            self.clear()
//        }) {
//
//            (errorMessage) in
//
//            self.error = errorMessage
//            self.showingAlert = true
//            return
//        }
//     //   self.clear()
//
//    }
//
//    func clear(){
//        self.text = ""
//        self.imageData = Data()
//        self.postImage = Image(systemName: "photo.fill")
//    }
//
////    func errorCheck() -> String? {
////        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
////            password.trimmingCharacters(in: .whitespaces).isEmpty ||
////            username.trimmingCharacters(in: .whitespaces).isEmpty ||
////            imageData.isEmpty{
////
////            return "Please fill in all fields and provide an image"
////        }
////        return nil
////
////    }
//
//
//    var body: some View {
//
//        VStack{
//
//            Text("Post").navigationBarTitleDisplayMode(.inline)
//
//            VStack{
//
//            if postImage != nil{
//                postImage!.resizable()
//                        .frame(width: 300, height: 200)
//                        .onTapGesture {
//                            self.showingActionSheet = true
//                        }
//            } else {
//                Image(systemName: "photo.fill")
//                    .resizable()
//                    .frame(width: 300, height: 200)
//                    .onTapGesture {
//                        self.showingActionSheet = true
//                    }
//            }
//            }
//
//            TextEditor(text: $text)
//                .frame(height: 200)
//                .padding(4)
//                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
//                .padding(.horizontal)
//
//            Button(action: uploadPost) {
//                Text("Post").font(.title).modifier(ButtonModifiers())
//            }
//
//            // 選択された場合は画像を表示
////            if imageData.count != 0{
////
////                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
////
////                    Image(uiImage: UIImage(data: imageData)!)
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
////                        .cornerRadius(15)
////
////                    // キャンセルするボタン
////
////                    Button(action: {imageData = Data(count: 0)}) {
////
////                        Image(systemName: "xmark")
////                            .foregroundColor(.white)
////                            .padding(10)
////                            .background(Color("blue"))
////                            .clipShape(Circle())
////                    }
////                }
////                .padding()
////            }
//        }.navigationTitle("Post")
//            .navigationBarTitleDisplayMode(.inline)
//        .padding()
//            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//
//                ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
//            }.actionSheet(isPresented: $showingActionSheet) {
//                ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")){
//                    self.sourceType = .photoLibrary
//                    self.showingImagePicker = true
//                },
//                .default(Text("Take A Photo")){
//                    self.sourceType = .camera
//                    self.showingImagePicker = true
//
//                }, .cancel()
//                ])
//            }
//    }
//}
//
//
