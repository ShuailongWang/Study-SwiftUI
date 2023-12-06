//
//  StaggeredView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/4.
//

import SwiftUI

struct StaggeredView: View {
    @State var listArray: [StaggeredModel] = staggeredArray
    @State var columns: Int = 1
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            StaggeredGrid(columns:columns, list:listArray, content: { item in
                
                StaggeredItem(itemModel: item)
                    .matchedGeometryEffect(id: item.id, in: animation)
                
            })
            .padding(.horizontal)
            .navigationTitle("Staggered Grid")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        columns += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        columns = max(columns - 1, 1)
                    } label: {
                        Image(systemName: "minus")
                    }
                }
            }
            .animation(.easeInOut, value: columns)
        }
        
        
        
    }
}

#Preview {
    StaggeredView()
}
