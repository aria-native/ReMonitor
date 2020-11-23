//
//  ReMonitor.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation
import ReSwift
import SwiftUI

public class ReMonitor: ObservableObject {
    public static let `default` = ReMonitor()

    @Published public var records = [ReMonitorRecord]()

    public func reset() {
        records.removeAll()
    }

    public func middleware<T: StateType>() -> Middleware<T> {
        { _, getState in { next in { action in
            let previousState = getState()
            next(action)
            let state = getState()

            let record = ReMonitorRecord(
                date: Date(),
                action: ActionInspector.record(action),
                state: StateInspector.record(state, previous: previousState)
            )
            self.records.append(record)
        } } }
    }
}
