//
//  Model.swift
//  SwiftUIDemo
//
//  Created by wangshuailong on 2023/11/29.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectdModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
