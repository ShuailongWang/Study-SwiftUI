//
//  Suggestion.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/30.
//

import SwiftUI

struct SuggestionModel: Identifiable {
    let id = UUID()
    var text: String
}

var suggestionArray = [
    SuggestionModel(text: "SwiftUI"),
    SuggestionModel(text: "React"),
    SuggestionModel(text: "Design"),
]
