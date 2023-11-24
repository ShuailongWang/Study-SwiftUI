//
//  TabItem.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct TabItemModel: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tabtype: TabType
    var color: Color
}

var tabItemArray: [TabItemModel?] = [
    TabItemModel(text: "Learn Now", icon: "house", tabtype:.home, color: .teal),
    TabItemModel(text: "Explore", icon: "magnifyingglass", tabtype:.explore, color: .blue),
    TabItemModel(text: "Notifications", icon: "bell", tabtype:.notifications, color: .red),
    TabItemModel(text: "Library", icon: "rectangle.stack", tabtype:.library, color: .pink)
]

enum TabType: String {
    case home
    case explore
    case notifications
    case library
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: ()-> CGFloat) {
        value = nextValue()
    }
}
