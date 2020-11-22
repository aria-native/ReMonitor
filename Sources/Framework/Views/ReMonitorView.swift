//
//  ReMonitorView.swift
//  ReMoniter
//
//  Created by knothole on 11/22/20.
//

import SwiftUI

public struct ReMonitorView: View {
    @ObservedObject var monitor = ReMonitor.default

    public init() {}

    public var body: some View {
        MonitorView(records: $monitor.records)
            .environmentObject(InspectorEnvironment())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReMonitorView()
    }
}
