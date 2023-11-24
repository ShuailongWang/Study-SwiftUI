//
//  NavigationBar.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            //模糊，矩形视图
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            //标题
            Text(title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            
            //图标
            HStack (spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .animatableFont(size: hasScrolled ? 22 : 34)
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height:70)
        .frame(maxHeight:.infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured", hasScrolled: .constant(false))
    }
}
