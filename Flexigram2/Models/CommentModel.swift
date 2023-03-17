//
//  CommentModel.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/18.
//

import Foundation


struct CommentModel: Encodable, Decodable, Identifiable{


    var id = UUID()
    var profile: String
    var postId: String
    var username: String
    var date: Double
    var comment: String
    var ownerId: String
}
