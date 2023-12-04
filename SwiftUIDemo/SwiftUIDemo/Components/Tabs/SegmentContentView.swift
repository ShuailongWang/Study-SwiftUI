//
//  SegmentContentView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct SegmentContentView: View {
    
    @State var selectIndex: Int = 0
    
    var body: some View {
        VStack (spacing: 0) {
            SegmentTabs(list: segmentTabsArray, selectIndex: $selectIndex)
            
            TabView (selection: $selectIndex) {
                ForEach (Array(segmentTabsArray.enumerated()), id:\.offset) { index, item in
                    Text(item.title).tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        
    }
}

#Preview {
    SegmentContentView()
}
