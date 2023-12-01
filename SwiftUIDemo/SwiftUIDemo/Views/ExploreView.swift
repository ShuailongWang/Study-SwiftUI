//
//  ExploreView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            coursesSection
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(title: "Recent", hasScrolled: .constant(true))
            )
            .background(
                Image("Blob 1").offset(x:-100, y:-400)
            )
        }
    }
    
    
    var coursesSection: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (spacing: 16) {
                ForEach(featuredCourseArray) { item in
                    SmallCourseItem(itemModel: item)
                }
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}

#Preview {
    ExploreView()
}
