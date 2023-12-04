//
//  RectRoundView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct RectRoundView: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.3)
                .frame(width: 100, height: 20)
                .progressViewStyle(BarProgressStyle(height:20))
            
            ProgressView(value: 0.3)
                .frame(width: 100, height: 20)
                .progressViewStyle(BarProgressStyle(height:20))
        }
    }
}

#Preview {
    RectRoundView()
}
