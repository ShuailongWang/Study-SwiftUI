//
//  LibraryView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                certifiSection
                
                Text("History".uppercased())
                    .titleStyle()
                
                coursesSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                
                topicsSection

            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(title: "Library", hasScrolled: .constant(true))
            )
            .background(
                Image("Blob 1").offset(x:-100, y:-400)
            )
        }
    }
    
    var certifiSection: some View {
        CertificateView()
            .frame(height: 220)
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.linearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .padding(20)
                    .offset(y: -30)
            )
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.linearGradient(
                        colors: [.teal, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .padding(40)
                    .offset(y: -60)
            )
            .padding(20)
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
    LibraryView()
}
