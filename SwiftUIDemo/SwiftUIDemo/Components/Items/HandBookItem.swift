//
//  HandBookItem.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct HandBookItem : View {
    var itemModel: Handbook = handArray[0]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height:90)
                .overlay {
                    Image(itemModel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height:100)
                }
            
            Text(itemModel.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            Text(itemModel.subtitle)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
            Text(itemModel.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth:200)
        .frame(height:260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(
                    colors: [itemModel.color1, itemModel.color2],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .rotation3DEffect(
                    .degrees(10),axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .bottomTrailing
                )
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

#Preview {
    HandBookItem()
}
