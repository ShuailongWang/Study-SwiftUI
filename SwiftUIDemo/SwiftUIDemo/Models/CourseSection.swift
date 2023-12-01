//
//  CourseSection.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct SectionRowModel: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var backround: String
    var logo: String
    var progress: CGFloat
}

var SectionRowArray: [SectionRowModel] = [
    SectionRowModel(
        title: "Advanced Custom Layout",
        subtitle: "SwiftUI for iOS 15",
        text: "Build an iOS app for iOS 15 with custom layouts, animations and",
        image: "Illustration 5",
        backround: "Background 5",
        logo: "Logo 2",
        progress: 0.5
    ),
    SectionRowModel(
        title: "Coding the Home View",
        subtitle: "UI Design for iOS 15",
        text: "Design an iOS app for iOS 15 with custom layouts, animations and ...",
        image: "Illustration 3",
        backround: "Background 3",
        logo: "Logo 4",
        progress: 0.2
    ),
    SectionRowModel(
        title: "Styled Components",
        subtitle: "Flutter for designers",
        text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.",
        image: "Illustration 1",
        backround: "Background 1",
        logo: "Logo 1",
        progress: 0.8
    ),
    SectionRowModel(
        title: "Flutter Interactions",
        subtitle: "React Hooks Advanced",
        text: "Learn how to build a with Typescript, Hooks, Contentful and Gatsby Cloud",
        image: "Illustration 2",
        backround: "Background 2",
        logo: "Logo 3",
        progress: 0.0
    ),
    
]
