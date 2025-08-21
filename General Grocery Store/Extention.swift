//
//  Extention.swift
//  General Grocery Store
//
//  Created by Absolute on 15/07/25.
//

import Foundation

extension Double {
    var clean: String {
        truncatingRemainder(dividingBy: 1) == 0
        ? String(format: "%.0f", self)
        : String(self)
    }
}
