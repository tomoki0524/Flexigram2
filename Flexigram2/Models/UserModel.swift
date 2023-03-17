//
//  UserModel.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/15.
//

import Foundation

struct User: Encodable, Decodable{
    var uid:String
    var email:String
    var profileImageUrl:String
    var username:String
    var searchName:[String]
    var bio:String
  //  var caption:String
//    var tagname:[String]
    //var tag:String
 //   var searchBio:[String]

}
