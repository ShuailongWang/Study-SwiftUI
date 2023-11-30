//
//  ScrollPreferenceKey.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/24.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0;
    static func reduce(value: inout CGFloat, nextValue:()-> CGFloat) {
        value = nextValue()
    }
}

struct CirclePreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0;
    static func reduce(value: inout CGFloat, nextValue:()-> CGFloat) {
        value = nextValue()
    }
}
