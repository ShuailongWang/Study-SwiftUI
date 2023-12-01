//
//  Topic.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}

var topicArray : [Topic] = [
    Topic(title: "iOS Development", icon: "iphone"),
    Topic(title: "UI Design", icon: "eyedropper"),
    Topic(title: "Web developent", icon: "laptopcomputer")
]
