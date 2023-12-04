//
//  SegmentCategoryModel.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/1.
//

import SwiftUI

struct SegmentTabModel: Identifiable {
    let id = UUID()
    let title: String
}

var segmentTabsArray : [SegmentTabModel] = [
    SegmentTabModel(title: "关注"),
    SegmentTabModel(title: "推荐"),
    SegmentTabModel(title: "热榜"),
    SegmentTabModel(title: "头条精选"),
    SegmentTabModel(title: "后端"),
    SegmentTabModel(title: "前端"),
    SegmentTabModel(title: "iOS"),
    SegmentTabModel(title: "安卓"),
    SegmentTabModel(title: "Java"),
    SegmentTabModel(title: "娱乐"),
    SegmentTabModel(title: "房产")
]
