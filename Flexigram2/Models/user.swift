//
//  File.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/02/14.
//

import Foundation

struct user: Encodable, Decodable{
    var uid:String

    var profileImageUrl:String
    var username:String
 
        
    var tag: String

    var ownerId: String
    var postId: String
 
    var serachTag: [String]
    
    
}
