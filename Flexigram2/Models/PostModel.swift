//
//  PostModel.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/16.
//

import Foundation

struct PostModel: Encodable, Decodable {

    var caption: String
    var likes: [String: Bool]
    var geoLocation: String
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
    var searchName: [String]
    var uid: String
 //   var tag: [String]

    
//    var email: String
//    var bio: String

}


