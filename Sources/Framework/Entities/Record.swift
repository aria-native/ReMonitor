//
//  Record.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation

public struct ReMonitorRecord: Identifiable, Codable {
    public struct Action: Codable {
        var summary: String
        var description: String

        public init(summary: String, description: String? = nil) {
            self.summary = summary
            self.description = description ?? summary
        }
    }

    public struct State: Codable {
        var state: String?
        var diff: String?
    }

    var date: Date
    var action: Action
    var state: State

    init(date: Date, action: ReMonitorRecord.Action, state: ReMonitorRecord.State) {
        self.date = date
        self.action = action
        self.state = state
    }

    // MARK: - Identifiable

    public var id: Date {
        date
    }
}
