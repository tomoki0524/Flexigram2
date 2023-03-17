//
//  Message.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/16.
//

import Foundation


struct Message: Encodable, Decodable, Identifiable {
    var id = UUID()
    
    var lastMessage: String
    var username: String
    var isPhoto: Bool
    var timestamp: Double
    var userId: String
    var profile: String
    
}
