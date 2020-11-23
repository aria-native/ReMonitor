//
//  StateInspector.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import MirrorDiffKit
import ReSwift
import SwiftPrettyPrint

enum StateInspector {
    static func record(_ state: StateType?, previous: StateType?) -> ReMonitorRecord.State {
        guard let state = state else {
            return ReMonitorRecord.State(state: nil, diff: nil)
        }
        var stateDescription = ""
        dump(state, to: &stateDescription)

        var stateDiff: String?

        if let previous = previous {
            stateDiff = diff(between: previous, and: state)
        } else {
            stateDiff = nil
        }

        return ReMonitorRecord.State(state: stateDescription, diff: stateDiff)
    }
}
