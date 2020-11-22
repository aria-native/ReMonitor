//
//  StateInspector.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation
import ReSwift

extension MonitorableState {
    func encode(with encoder: JSONEncoder) throws -> String? {
        let data = try encoder.encode(self)
        return String(data: data, encoding: .utf8)
    }
}

class StateInspector {
    let encoder: JSONEncoder
    init() {
        encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
    }

    func stringfy(_ state: StateType?) -> String {
        guard let state = state else {
            return "(nil)"
        }
        guard let monitorableState = state as? MonitorableState else {
            return "(unknown)"
        }

        do {
            return try monitorableState.encode(with: encoder) ?? "()"
        } catch {
            return error.localizedDescription
        }
    }
}
