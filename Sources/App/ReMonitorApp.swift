//
//  ReMoniterApp.swift
//  ReMoniter
//
//  Created by knothole on 11/22/20.
//

import SwiftUI

@main
struct ReMoniterApp: App {
    var body: some Scene {
        WindowGroup {
            CounterExampleView()
                .padding(100.0)
        }
        Settings {
            ContentView()
        }
    }
}
