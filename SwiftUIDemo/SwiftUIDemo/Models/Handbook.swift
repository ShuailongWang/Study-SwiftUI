//
//  Handbook.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct Handbook: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let text: String
    let logo: String
    let image: String
    let color1: Color
    let color2: Color
}

var handArray : [Handbook] = [
    Handbook(
        title: "SwiftUI Handbook",
        subtitle: "80 sections - 9 hours",
        text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development technigques",
        logo: "Logo 1",
        image: "Illustration 1",
        color1: .teal,
        color2: .blue
    ),
    Handbook(
        title: "React Handbook",
        subtitle: "30 sections - 3 hours",
        text: "A comprehensive guide for an overview of the React library and all its basics",
        logo: "Logo 1",
        image: "Illustration 2",
        color1: .purple,
        color2: .pink
    )
]
