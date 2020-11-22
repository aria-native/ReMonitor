//
//  Action+ReMonitor.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift

extension Action {
    var monitorString: String {
        if let action = self as? CustomStringConvertible {
            return action.description
        } else if (self as? ReSwiftInit) != nil {
            return "$init"
        } else {
            return "<?>"
        }
    }
}
