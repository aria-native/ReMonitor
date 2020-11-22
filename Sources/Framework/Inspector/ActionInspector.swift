//
//  StateType+ReMonitor.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import Foundation
import ReSwift

class ActionInspector {
    func stringfy(_ action: Action) -> String {
        if let action = action as? CustomStringConvertible {
            return action.description
        } else if (action as? ReSwiftInit) != nil {
            return "$init"
        } else {
            return "<?>"
        }
    }
}
