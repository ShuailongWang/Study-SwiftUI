//
//  StaggeredModel.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/4.
//

import SwiftUI

enum StagereType: Hashable {
    case small
    case middle
    case large
}

struct StaggeredModel: Identifiable, Hashable {
    let id = UUID()
    var type: StagereType
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var backround: String
    var logo: String
}


var staggeredArray: [StaggeredModel] = [
    StaggeredModel(
        type: .small,
        title: "SwiftUI for iOS 15",
        subtitle: "20 sections - 3 hours",
        text: "Build an iOS app for iOS 15 with custom layouts, animations and",
        image: "Illustration 5",
        backround: "Background 5",
        logo: "Logo 2"
    ),
    StaggeredModel(
        type: .small,
        title: "UI Design for iOS 15",
        subtitle: "20 sections - 3 hours",
        text: "Design an iOS app for iOS 15 with custom layouts, animations and ...",
        image: "Illustration 3",
        backround: "Background 3",
        logo: "Logo 4"
    ),
    StaggeredModel(
        type: .small,
        title: "Flutter for designers",
        subtitle: "20 sections - 1 hours",
        text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.",
        image: "Illustration 1",
        backround: "Background 1",
        logo: "Logo 1"
    ),
    StaggeredModel(
        type: .small,
        title: "React Hooks Advanced",
        subtitle: "20 sections - 2 hours",
        text: "Learn how to build a with Typescript, Hooks, Contentful and Gatsby Cloud",
        image: "Illustration 2",
        backround: "Background 2",
        logo: "Logo 3"
    ),
    StaggeredModel(
        type: .small,
        title: "iOS 15 SwiftUI for",
        subtitle: "20 sections - 3 hours",
        text: "Build an iOS app for iOS 15 with custom layouts, animations and",
        image: "Illustration 5",
        backround: "Background 5",
        logo: "Logo 2"
    ),
    StaggeredModel(
        type: .small,
        title: "iOS UI Design",
        subtitle: "20 sections - 3 hours",
        text: "Design an iOS app for iOS 15 with custom layouts, animations and ...",
        image: "Illustration 3",
        backround: "Background 3",
        logo: "Logo 4"
    ),
    StaggeredModel(
        type: .small,
        title: "Flutter designers",
        subtitle: "20 sections - 1 hours",
        text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.",
        image: "Illustration 1",
        backround: "Background 1",
        logo: "Logo 1"
    ),
    StaggeredModel(
        type: .small,
        title: "React Hooks",
        subtitle: "20 sections - 2 hours",
        text: "Learn how to build a with Typescript, Hooks, Contentful and Gatsby Cloud",
        image: "Illustration 2",
        backround: "Background 2",
        logo: "Logo 3"
    ),
    
]
