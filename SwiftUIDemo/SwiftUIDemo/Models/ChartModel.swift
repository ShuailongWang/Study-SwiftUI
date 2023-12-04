//
//  ChartModel.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/4.
//

import SwiftUI

struct ChartModel: Identifiable {
    let id = UUID()
    let shortDay: String
    let steps: CGFloat
    let period: String
    let weekdayString: String = ""
}


var lineArray: [ChartModel] = [
    ChartModel(shortDay: "Sun", steps: 15000, period: "Previous"),
    ChartModel(shortDay: "Mon", steps: 7000,  period: "Previous"),
    ChartModel(shortDay: "Tue", steps: 9000,  period: "Previous"),
    ChartModel(shortDay: "Wed", steps: 25000, period: "Previous"),
    ChartModel(shortDay: "Thu", steps: 16000, period: "Previous"),
    ChartModel(shortDay: "Fn",  steps: 18000, period: "Previous"),
    ChartModel(shortDay: "Sat", steps: 2000,  period: "Previous")
]
