//
//  CourseItem.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/29.
//

import SwiftUI

struct CourseItem: View {
    var namespace: Namespace.ID
    var itemModel: FeaturCourseModel = featuredCourseArray[0]
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading, spacing: 12) {
                Text(itemModel.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(itemModel.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(itemModel.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(itemModel.id)", in: namespace)
                Text(itemModel.text)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text\(itemModel.id)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(itemModel.id)", in: namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image(itemModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(itemModel.id)", in: namespace)
        )
        .background(
            Image(itemModel.backround)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(itemModel.id)", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(itemModel.id)", in: namespace)
        }
        .frame(height: 300)
        .padding(20)
    }
}


struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseItem(namespace: namespace, show: .constant(true))
    }
}

