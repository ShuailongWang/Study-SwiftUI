//
//  AnimationFontModifier.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/24.
//

import SwiftUI

struct AnimationFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableDate: Double {
        get {size}
        set {size = newValue}
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight:weight, design: design))
    }
}

extension View {
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimationFontModifier(size: size, weight: weight, design: design))
    }
}
