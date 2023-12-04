//
//  SegmentTabs.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct SegmentTabs: View {
    let list: [SegmentTabModel]
    @Binding var selectIndex: Int
    @Namespace var animationNamespace
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (Array(list.enumerated()), id: \.offset) { index, item in
                        Button {
                            withAnimation {
                                selectIndex = index
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text(item.title)
                                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 10, trailing: 12))
                                    .fixedSize()
                                    .foregroundColor(selectIndex == index ? Color.red : Color.black)
                                    .font(.system(size: selectIndex == index ? 20 : 17))
                                    .fontWeight(selectIndex == index ? .bold : .regular)
                                    .animation(nil, value:UUID())
                                Spacer()
                            }
                            .background(
                                VStack{
                                    if (selectIndex == index) {
                                        Spacer()
                                        Rectangle()
                                            .fill(Color.red)
                                            .frame(height: 2)
                                            .padding(.horizontal,12)
                                            .cornerRadius(2)
                                            .matchedGeometryEffect(id: "tab_line", in: animationNamespace)
                                    }
                                }
                            )
                        }
                    }
                }
                .frame(minWidth: UIScreen.main.bounds.width)
            }
            .onChange(of: selectIndex) { newSelect in
                withAnimation(.easeInOut) {
                    proxy.scrollTo(selectIndex, anchor: .center)
               }
            }
        }
    }
}

#Preview {
    SegmentTabs(list: segmentTabsArray, selectIndex:.constant(0))
}
