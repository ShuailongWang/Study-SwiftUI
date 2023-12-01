//
//  CircularView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct CircularView: View {
    var value: CGFloat = 0.2    //进度
    var lineWidth: Double = 4   //线宽
    @State var appear = false   //动画
    
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0) //起点-结束
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))//线样式
            .fill(.angularGradient(
                colors: [.purple, .pink, .purple],
                center: .center,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            ))//填充色
            .rotationEffect(.degrees(270))//旋转
            .onAppear {//显示
                withAnimation(.spring().delay(0.5)) {
                    appear = true
                }
            }
            .onDisappear {//消失
                appear = false
            }
    }
}

#Preview {
    CircularView()
}
