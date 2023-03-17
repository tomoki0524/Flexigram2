//
//  SearchBarClone.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2022/01/23.
//

import Foundation
import SwiftUI

struct SearchBarClone: View {

    @Binding var value: String
    @State var isSearching = false

    var body: some View {

        HStack{
            TextField("Search users here", text:$value)

                .padding(.leading, 24)
        }.padding()
        .background(Color(.systemGray5))
        .cornerRadius(6.0)
        .padding(.horizontal)
        .onTapGesture(perform: {
            isSearching = true
        })
        .overlay(
            HStack{
                Image(systemName: "magnifyingglass")
                Spacer()

                Button( action: {value = ""} ){
                    Image(systemName: "xmark.circle.fill")
                }

            }.padding(.horizontal, 32)
            .foregroundColor(.black)
        )

    }
}

