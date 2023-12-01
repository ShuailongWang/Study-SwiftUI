//
//  SmallCourseItem.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct SmallCourseItem: View {
    var itemModel: FeaturCourseModel = featuredCourseArray[0]
    
    var body: some View {
        VStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black.opacity(0.1))
                .overlay {
                    Image(itemModel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height:105)
                }
            Text(itemModel.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Text(itemModel.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width:160, height:200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

#Preview {
    SmallCourseItem()
}
