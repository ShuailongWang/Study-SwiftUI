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
            
            ScrollView {
                coursesSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                
                topicsSection
                
                Text("Popular".uppercased())
                    .titleStyle()

                handbooksSection
            }
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
    
    var handbooksSection: some View {
        HStack (alignment: .top, spacing: 16) {
            ForEach(handArray) { item in
                HandBookItem(itemModel: item)
            }
        }
        .padding(.horizontal, 20)
    }
    
    var topicsSection: some View {
        VStack () {
            ForEach(topicArray) { item in
                ListRow(topModel: item)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ExploreView()
}
