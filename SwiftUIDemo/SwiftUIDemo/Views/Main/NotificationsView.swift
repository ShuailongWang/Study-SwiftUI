//
//  NotificationsView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        Color("Background").ignoresSafeArea()
        
        ScrollView {
            sectionsSection
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height:70)
        })
        .overlay {
            NavigationBar(title:"Notifications", hasScrolled: .constant(true))
        }
        .background(
            Image("Blob 1").offset(x: -180, y:300)
        )
    }
    
    
    var sectionsSection: some View {
        VStack (alignment:.leading) {
            ForEach(Array(SectionRowArray.enumerated()), id:\.offset) { index, item in
                if index != 0 {
                    Divider()
                }
                SectionRow(section: item)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

#Preview {
    NotificationsView()
}
