//
//  ListRow.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct ListRow: View {
    var topModel: Topic = topicArray[0]
    
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: topModel.icon)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            Text(topModel.title)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#Preview {
    ListRow()
}
