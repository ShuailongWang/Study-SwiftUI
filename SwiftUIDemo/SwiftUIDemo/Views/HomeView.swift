//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            Color.clear.frame(height:1000)
        }
        .safeAreaInset(edge: .top, content: {
            //创建一个高度为 70 的透明矩形视图
            Color.clear.frame(height:70)
        })
        .overlay(
            //overlay是一种布局修饰符，用于在视图的顶部添加其他视图。
            //这使得您可以在现有视图的基础上叠加额外的内容
            NavigationBar(title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
