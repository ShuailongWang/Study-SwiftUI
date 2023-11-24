//
//  AccountView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    
    var body: some View {
        //NavigationStack
        NavigationView {
            //List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    //个人信息
    var profile: some View {
        VStack(spacing: 8)  {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .blue,
                     .blue.opacity(0.3)
                )
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
//                    Image(systemName: "hexagon")
//                        .symbolVariant(.fill)
//                        .foregroundColor(.blue)
//                        .font(.system(size: 200))
//                        .offset(x: -50, y: -100)
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Meng To")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    //菜单
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                //ContentView()
                Text("Billing")
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {} label: {
                Label("Help", systemImage: "questionmark")
                    .imageScale(.small)
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    //链接
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://www.baidu.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    //滑动删除
                    Button(action: {
                        isDeleted = true
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    //定
                    pinButton
                }
            }
            
            Link(destination: URL(string: "https://www.youtube.com")!) {
                HStack {
                    Label("YouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    //Button
    var pinButton: some View {
        Button(action: {
            isPinned.toggle()
        }) {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
