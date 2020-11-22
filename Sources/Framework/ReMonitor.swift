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

    @Published var records = [Record]()

    public func middleware<T: StateType>() -> Middleware<T> {
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
