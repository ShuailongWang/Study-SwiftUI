//
//  SearchView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/30.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var show = false
    @Namespace var namespace
    @State var selectIndex = 0
    @Environment(\.presentationMode) var presentationMode //取消按钮模型
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1").offset(x:-100, y:-200)
                )
            }
            .searchable( text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("SwiftUI, React, UI Design")) {
                //搜索建议
                ForEach (suggestionArray) {suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
            .sheet(isPresented: $show) {
                CourseView(namespace: namespace, itemModel: featuredCourseArray[selectIndex], show: $show)
            }
        }
    }
    
    
    var content: some View {
        ForEach (Array(featuredCourseArray.enumerated()), id: \.offset) { index, item in
            if item.title.contains(text) || text == "" {
                if index != 0 {
                    Divider()
                }
                
                Button {
                    show = true
                    selectIndex = index
                } label: {
                    HStack (alignment: .top, spacing: 12) {
                        Image (item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:44, height:44)
                            .background(Color("Background"))
                            .mask(Circle())
                        VStack (alignment: .leading, spacing: 4) {
                            Text(item.title).bold()
                                .foregroundColor(.primary)
                            Text(item.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
