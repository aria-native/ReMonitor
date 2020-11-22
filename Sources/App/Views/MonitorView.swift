//
//  MonitorView.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift
import SwiftUI

struct MonitorView: View {
    @EnvironmentObject var environment: InspectorEnvironment

    @Binding var records: [Record]
    var body: some View {
        NavigationView {
            List(records) { record in
                NavigationLink(
                    environment.stringfy(action: record.action),
                    destination: RecordView(record: record)
                )
            }
        }
    }
}

struct MonitorView_Previews: PreviewProvider {
    @State static var records = [
        Record(date: Date(timeIntervalSince1970: 0), action: CounterActionIncrease()),
        Record(date: Date(timeIntervalSince1970: 1), action: CounterActionIncrease()),
        Record(date: Date(timeIntervalSince1970: 2), action: CounterActionDecrease()),
        Record(date: Date(timeIntervalSince1970: 3), action: CounterActionIncrease()),
    ]
    static var previews: some View {
        MonitorView(records: $records)
            .environmentObject(InspectorEnvironment())
    }
}
