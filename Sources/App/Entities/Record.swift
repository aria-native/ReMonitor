//
//  Record.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation
import ReSwift

struct Record: Identifiable {
    var id: Date {
        date
    }

    var date: Date
    var action: Action
}
