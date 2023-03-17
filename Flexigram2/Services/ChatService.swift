//
//  ChatService.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/17.
//

import Foundation
import Firebase
import FirebaseFirestore



class ChatService:ObservableObject {
    
    static var chats = AuthService.storeRoot.collection("chats")
    static var messages = AuthService.storeRoot.collection("messages")
    
    static func conversation(sender: String, recipient: String) ->
    CollectionReference {
        return chats.document(sender).collection("chats").document(recipient).collection("conversation")
    }
    
    static func userMessages(userid: String) -> CollectionReference {
        return messages.document(userid).collection("messages")
    }
    
    static func messagesId(senderId: String, recipientId: String) -> DocumentReference{
        return messages.document(senderId).collection("messages").document(recipientId)
    }
    
    
    func sendMessage(message: String, recipientId: String, recipientProfile: String, recipientName: String, onSuccess: @escaping()-> Void, onError: @escaping(_ error: String)-> Void){
        
        guard let senderId = Auth.auth().currentUser?.uid else {return}
        guard let senderUsername = Auth.auth().currentUser?.displayName else {return}
        guard let senderProfile = Auth.auth().currentUser?.photoURL!.absoluteString else {return}
        
        let messageId = ChatService.conversation(sender: senderId, recipient: recipientId).document().documentID
        
        let chat = Chat(messageId: messageId, textMessage: message, profile: senderProfile, photoUrl: "", sender: senderId, username: senderUsername, timestamp: Date().timeIntervalSince1970, isPhoto: false)
        
        guard let dict = try? chat.asDictionary() else{return}
        
        ChatService.conversation(sender: senderId, recipient: recipientId).document(messageId).setData(dict) {
            (error) in
            
            if error == nil {
                ChatService.conversation(sender: recipientId, recipient: senderId).document(messageId).setData(dict)
                
                let senderMessage = Message(lastMessage: message, username: senderUsername, isPhoto: false, timestamp: Date().timeIntervalSince1970, userId: senderId, profile: senderProfile)
                
                let recipientMessage = Message(lastMessage: message, username: recipientName, isPhoto: false, timestamp: Date().timeIntervalSince1970, userId: recipientId, profile: recipientProfile)
                
                guard let senderDict = try? senderMessage.asDictionary() else{return}
                
                guard let recipientDict = try? recipientMessage.asDictionary() else{return}
                
                ChatService.messagesId(senderId: senderId, recipientId: recipientId).setData(senderDict)
                
                ChatService.messagesId(senderId: recipientId, recipientId: senderId).setData(recipientDict)
                
                onSuccess()
            } else {
                onError(error!.localizedDescription)
            }
        }
    }
    
    func sendPhotoMessage(imageData: Data, recipientId: String, recipientProfile: String, recipientName: String, onSuccess: @escaping()-> Void, onError: @escaping(_ error: String)-> Void) {
        
        guard let senderId = Auth.auth().currentUser?.uid else {return}
        guard let senderUsername = Auth.auth().currentUser?.displayName else {return}
        guard let senderProfile = Auth.auth().currentUser?.photoURL!.absoluteString else {return}
        
        let messageId = ChatService.conversation(sender: senderId, recipient: recipientId).document().documentID
        
        let storageChatRef = StorageService.storageChatId(chatId: messageId)
        
        let metadate = StorageMetadata()
        metadate.contentType = "image/jpg"
        
        StorageService.saveChatPhoto(messageId: messageId, recipientId: recipientId, recipientProfile: recipientProfile, recipientName: recipientName, senderProfile: senderProfile, senderId: senderId, senderUsername: senderUsername, imageData: imageData, metadata: metadate, storageChatRef: storageChatRef, onSuccess: onSuccess, onError: onError)
        
    }
    
    
    func getChats(userId: String, onSuccess: @escaping([Chat])-> Void, onError: @escaping(_ error: String)-> Void, newChat: @escaping(Chat)-> Void, listener: @escaping(_ listenerHandle: ListenerRegistration)-> Void) {
        
        let listenerChat = ChatService.conversation(sender: Auth.auth().currentUser!.uid, recipient: userId).order(by: "timestamp", descending: false).addSnapshotListener{
            (qs, err) in
            
            guard let snapshot = qs else {
                return
            }
            
            var chats = [Chat]()
            
            snapshot.documentChanges.forEach{
                (diff) in
                
                if(diff.type == .added) {
                    let dict = diff.document.data()
                    
                    guard let decoded = try?
                            Chat.init(fromDictionary: dict) else {
                                return
                            }
                    newChat(decoded)
                    chats.append(decoded)
                }
                
                if(diff.type == .modified) {
                    print("modified")
                }
                
                if(diff.type == .removed) {
                    print("removed")
                }
                
                
            }
            onSuccess(chats)
        }
        listener(listenerChat)
    }
    
    func getMessages(onSuccess: @escaping([Message])-> Void, onError: @escaping(_ error: String)-> Void, newMessage: @escaping(Chat)-> Void, listener: @escaping(_ listenerHandle: ListenerRegistration)-> Void){
        
        
        let listenerChat = ChatService.userMessages(userid: Auth.auth().currentUser!.uid).order(by: "timestamp", descending: false).addSnapshotListener{
            (qs, err) in
            
            guard let snapshot = qs else {
                return
            }
            
            var chats = [Chat]()
        }
    }
}
