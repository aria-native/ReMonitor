//
//  ReMonitor.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation
import ReSwift
import SwiftUI

class ReMonitor: ObservableObject {
    static let `default` = ReMonitor()

    @Published var records = [Record]()

    func monitor() -> Middleware<AppState> {
        { _, getState in { next in { action in
            self.records.append(
                Record(
                    date: Date(),
                    action: action,
                    state: getState()
                )
            )
            next(action)
        } } }
    }
}
