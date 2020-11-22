//
//  InspectorEnvironment.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift
import SwiftUI

class InspectorEnvironment: ObservableObject {
    let actionInspector = ActionInspector()
    let stateInspector = StateInspector()

    func stringfy(action: Action) -> String {
        actionInspector.stringfy(action)
    }

    func stringfy(state: StateType?) -> String {
        stateInspector.stringfy(state)
    }
}
