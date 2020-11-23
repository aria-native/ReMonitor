//
//  StateType+ReMonitor.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift

public protocol ReMonitorAction {
    var monitorDescription: ReMonitorRecord.Action { get }
}

enum ActionInspector {
    static func record(_ action: Action) -> ReMonitorRecord.Action {
        if let action = action as? ReMonitorAction {
            return action.monitorDescription
        } else if let action = action as? CustomStringConvertible {
            return ReMonitorRecord.Action(summary: action.description)
        } else if (action as? ReSwiftInit) != nil {
            return ReMonitorRecord.Action(summary: "$init")
        } else {
            return ReMonitorRecord.Action(
                summary: String(describing: type(of: action)),
                description: String(reflecting: action)
            )
        }
    }
}
