//
//  Chat.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/16.
//

import Foundation
import Firebase


struct Chat: Encodable, Decodable, Hashable {
    
    var messageId: String
    var textMessage: String
    var profile: String
    var photoUrl: String
    var sender: String
    var username: String
    var timestamp: Double
    var isCurrentUser: Bool{
        
        return Auth.auth().currentUser!.uid == sender
    }
    var isPhoto: Bool
    
}
