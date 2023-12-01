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
    @AppStorage("ShowModal") var showModal = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack (alignment: .bottom) {
            //页面
            Group {
                switch selectedTabType {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //Tabbar
            Tabbar()
                .offset(y: model.showDetail ? 200 : 0)
            
            if showModal {
                ModalView()
                    .zIndex(1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height:44)
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
            //.preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}

