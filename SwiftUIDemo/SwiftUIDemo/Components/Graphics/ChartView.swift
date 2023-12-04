//
//  ChartView.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/12/4.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack {
            chartItemView
            
        }
        .padding()
    }
    
    
    
    
    var chartItemView: some View {
        Chart {
            BarMark(x: .value("Day", "Jun 1"), y: .value("Value", 50))
                .cornerRadius(10)
            BarMark(x: .value("Day", "Jun 2"), y: .value("Value", 30))
                .cornerRadius(10)
            BarMark(x: .value("Day", "Jun 3"), y: .value("Value", 20))
                .cornerRadius(10)
        }
        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
    
    
}

#Preview {
    ChartView()
}


