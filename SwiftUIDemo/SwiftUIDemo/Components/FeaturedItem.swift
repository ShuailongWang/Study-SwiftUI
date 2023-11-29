//
//  FeaturedItem.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

struct FeaturedItem: View {
    var itemModel: FeaturCourseModel = homeCourseArray[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(itemModel.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            Text(itemModel.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    .linearGradient(//渐变
                        //colors: [.red, .blue],
                        colors: [.primary, .primary.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
            Text(itemModel.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
            Text(itemModel.text)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        //.cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
//        .mask(//平滑的圆角
//            RoundedRectangle(
//                cornerRadius: 30, style: .continuous
//            )
//        )
//        .modifier(StrokeStyle())
        .strokeStyle(cornerRadius: 30.0)
        .padding(.horizontal, 20.0)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
