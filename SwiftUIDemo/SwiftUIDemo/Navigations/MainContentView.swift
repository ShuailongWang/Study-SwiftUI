//
//  MainContentView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//
//  容器
//

import SwiftUI

struct MainContentView: View {
    @AppStorage("selectedTab") var selectedTabType: TabType = .home
    
    var body: some View {
        ZStack (alignment: .bottom) {
            //页面
            Group {
                switch selectedTabType {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //Tabbar
            Tabbar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height:44)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
            //.preferredColorScheme(.dark)
    }
}

