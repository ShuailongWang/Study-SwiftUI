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
                .offset(y: model.showDetail ? 200 : 0)
            
            if showModal {
                ZStack {
                    Color.clear.background(.regularMaterial)
                        .ignoresSafeArea()
                    
                    SignUpView()
                    
                    Button {
                        withAnimation {
                            showModal = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.body.weight(.bold))
                            .foregroundColor(.secondary)
                            .padding(8)
                        .background(.ultraThinMaterial, in: Circle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(20)
                }
                .zIndex(1)
            }
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
            .environmentObject(Model())
    }
}

