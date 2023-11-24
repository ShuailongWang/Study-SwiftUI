//
//  Tabbar.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct Tabbar: View {
    @AppStorage("selectedTab") var selectedTabType: TabType = .home
    @State var selectedTabColor: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            buttonItems
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(//点击背景
            tabbarBackground
        )
        .overlay(//线
            tabbarLine
        )
        .strokeStyle(cornerRadius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    //按钮列表
    var buttonItems: some View {
        ForEach (tabItemArray.compactMap { $0 }) {item in
            tabItemView(item: item)
        }
    }
    
    //单个tabbarView
    //抽出来否则抱错：The compiler is unable to type-check this expression in reasonable time; try breaking up the
    func tabItemView(item: TabItemModel) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTabType = item.tabtype
                selectedTabColor = item.color
            }
        } label: {
            VStack (spacing:0) {
                Image(systemName: item.icon)
                    .symbolVariant(.fill)
                    .font(.body.bold())
                    .frame(width: 80, height: 29)
                Text(item.text)
                    .font(.caption2)
                    .lineLimit(1)
            }
            .frame(maxWidth:.infinity)
        }
        .foregroundStyle(selectedTabType == item.tabtype ? .primary : .secondary)
        .blendMode(selectedTabType == item.tabtype ? .overlay : .normal)
        .overlay(
            GeometryReader { proxy in
                Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
            }
        )
        .onPreferenceChange(TabPreferenceKey.self) { value in
            tabItemWidth = value
        }
    }
    
    //点击背景
    var tabbarBackground: some View {
        HStack {
            if selectedTabType == .library { Spacer() }
            if selectedTabType == .explore { Spacer() }
            if selectedTabType == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(selectedTabColor).frame(width: tabItemWidth)
            if selectedTabType == .home { Spacer() }
            if selectedTabType == .explore {
                Spacer()
                Spacer()
            }
            if selectedTabType == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    
    //点击移动的线
    var tabbarLine: some View {
        HStack {
            if selectedTabType == .library { Spacer() }
            if selectedTabType == .explore { Spacer() }
            if selectedTabType == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(selectedTabColor)
                .frame(width:28, height:5)
                .cornerRadius(3)
                .frame(width:tabItemWidth)
                .frame(maxHeight: .infinity, alignment:.top)
            if selectedTabType == .home { Spacer() }
            if selectedTabType == .explore {
                Spacer()
                Spacer()
            }
            if selectedTabType == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
