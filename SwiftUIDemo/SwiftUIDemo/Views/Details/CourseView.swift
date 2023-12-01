//
//  CourseView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/29.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var itemModel: FeaturCourseModel = featuredCourseArray[0]
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    @State var showSection = false
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                coverView
                
                contentView
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .onAppear {
                model.showDetail = true
            }
            .onDisappear() {
                model.showDetail = false
            }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style:.continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture ( //拖拽
                isDraggable ? drag : nil
            )
            .ignoresSafeArea()
            
            closeButton
        }
        .onAppear {
            fadeIn()
        }
        .onChange(of: show) { newValue in
            fadeOut()
        }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() {
        withAnimation(.closeCard) {
            show.toggle()
            model.showDetail.toggle()
        }
        
        withAnimation(.closeCard) {
            viewState = .zero
        }
        isDraggable = false
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local).onChanged {value in
            guard value.translation.width > 0 else { return }
            
            if value.startLocation.x < 100 {
                withAnimation(.closeCard) {
                    viewState = value.translation
                }
            }
            
            if viewState.width > 120 {
                close()
            }
        }
        .onEnded({ value in
            if viewState.width > 80 {
                close()
            } else {
                withAnimation(.closeCard) {
                    viewState = .zero
                }
            }
        })
    }
    
    var coverView: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack () {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500 + (scrollY > 0 ? scrollY : 0))
            .padding(20)
            .foregroundStyle(.black)
            .background(
                Image(itemModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .matchedGeometryEffect(id: "image\(itemModel.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                Image(itemModel.backround)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(itemModel.id)", in: namespace)
                    .offset(y:scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask (
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(itemModel.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    
    var contentView: some View {
        VStack (alignment:.leading) {
            ForEach(Array(SectionRowArray.enumerated()), id:\.offset) { index, item in
                if index != 0 {
                    Divider()
                }
                SectionRow(section: item)
                    .onTapGesture {
                        selectedIndex = index
                        showSection = true
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showSection) {
            SectionView(itemModel: SectionRowArray[selectedIndex])
        }
    }
    
    
    var closeButton: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                model.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View {
        VStack (alignment: .leading, spacing: 12) {
            Text(itemModel.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(itemModel.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(itemModel.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(itemModel.id)", in: namespace)
            Text(itemModel.text
            )
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(itemModel.id)", in: namespace)
            
            Divider()
                .opacity(appear[0] ? 1 : 0)
            
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Taught by Meng To")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "blur\(itemModel.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}

