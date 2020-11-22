//
//  ContentView.swift
//  ReMoniter
//
//  Created by knothole on 11/22/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var monitor: ReMonitor

    var body: some View {
        MonitorView(records: $monitor.records)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(monitor: ReMonitor())
    }
}
