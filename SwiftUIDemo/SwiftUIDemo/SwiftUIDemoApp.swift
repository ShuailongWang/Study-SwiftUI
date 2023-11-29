//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
                .environmentObject(model)
        }
    }
}
