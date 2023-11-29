//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//
//  GeometryReader
//  GeometryReader 是 SwiftUI 中的一个容器视图，它允许您访问其父视图的几何信息。
//  这对于创建自适应界面或者需要基于父视图的大小进行布局的情况非常有用。
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolledBol = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()  //忽略安全区域
            
            ScrollView {
                //滚动检测
                scrollDetection
                
                //卡片
                tableView
                
                //提示
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                //底部区域
                if !show {
                    cards
                } else {
                    //占位空间
                    details
                }
            }
            .coordinateSpace(name: "scroll") //坐标空间名称
            .safeAreaInset(edge: .top, content: {
                //创建一个高度为 70 的透明矩形视图
                Color.clear.frame(height:70)
            })
            .overlay(
                //overlay是一种布局修饰符，用于在视图的顶部添加其他视图。
                //这使得您可以在现有视图的基础上叠加额外的内容
                NavigationBar(title: "Featured", hasScrolled: $hasScrolledBol)
            )
            
            if show {
                ForEach(featuredCourseArray) { item in
                    if selectedID == item.id {
                        CourseView(namespace: namespace, itemModel: item, show: $show)
                            .zIndex(1)
                            .transition(.asymmetric(
                                insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                                removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                            ))
                    }
                }
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation (.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
    
    //滚动检测
    var scrollDetection: some View {
        GeometryReader { proxy in
            //Text("\(proxy.frame(in: .named("scroll")).minY)")
            
            /*
             1. Color.clear
             这是一个 Color 类型的 View，但由于颜色是透明的，实际上不会在界面上显示任何内容
             2. .preference(key: value:): 这是 View 协议中的一个方法，用于设置 PreferenceKey。preference 方法允许您在视图层次结构中传递和收集数据
             */
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation (.easeInOut) {
                hasScrolledBol = value < 0;
            }
        })
    }
    
    //列表
    var tableView: some View {
        TabView {
            ForEach (homeCourseArray) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(itemModel: item)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x:0, y:1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x:0, y:10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    var cards: some View {
        ForEach(featuredCourseArray) { item in
            CourseItem(namespace: namespace, itemModel: item, show: $show)
                .onTapGesture {
                    withAnimation (.openCard) {//tan huang
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = item.id
                    }
                }
        }
    }
    
    var details: some View {
        ForEach(featuredCourseArray) { item in
            Rectangle()
                .fill(.white)
                .frame(height: 300)
                .cornerRadius(30)
                .shadow(color: Color("Shadow"), radius: 20, x:0,y:10)
                .opacity(0.3)
                .padding(.horizontal, 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}




/*
     基本用法：
     使用 GeometryReader 时，它会将自身的大小提供给其内容视图，然后你可以使用这些信息进行布局。
     GeometryReader { geometry in
         Text("Width: \(geometry.size.width), Height: \(geometry.size.height)")
             .padding()
     }
     
     坐标空间转换：
     GeometryReader 提供的 geometry 对象包含了一些属性，如 size、safeAreaInsets 等，还可以通过 geometry.frame(in: .global) 等方法将坐标从局部转换为全局或者其他坐标空间。
     GeometryReader { geometry in
         Text("Top: \(geometry.frame(in: .global).minY)")
             .padding()
     }
    
     动态布局：
    GeometryReader 通常用于在不同屏幕大小或设备方向下创建动态布局。
     GeometryReader { geometry in
         if geometry.size.width > 300 {
             Text("Wide Screen")
         } else {
             Text("Narrow Screen")
         }
         .padding()
     }
 
     For Each 中的 GeometryReader
     GeometryReader 在 ForEach 中的使用也很常见，以确保每个项目都能访问自己的几何信息。
     VStack {
         ForEach(0..<5) { index in
             GeometryReader { geometry in
                 Text("Item \(index)")
                     .frame(width: geometry.size.width, height: geometry.size.height)
             }
             .background(Color.blue)
             .cornerRadius(10)
             .padding(5)
         }
     }
 */
