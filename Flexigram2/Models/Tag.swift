//
//  TagModel.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/10/26.
//

import SwiftUI

// Tag Model...
struct Tag: Identifiable,Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}

