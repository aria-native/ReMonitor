//
//  MonitorView.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift
import SwiftUI

public struct MonitorView: View {
    @Binding public var records: [ReMonitorRecord]

    public init(records: Binding<[ReMonitorRecord]>) {
        _records = records
    }

    public var body: some View {
        NavigationView {
            List(records) { record in
                NavigationLink(
                    record.action.summary,
                    destination: RecordView(
                        record: record
                    )
                )
            }
        }
    }
}

struct MonitorView_Previews: PreviewProvider {
    @State static var records = [
        ReMonitorRecord(
            date: Date(),
            action: ReMonitorRecord.Action(summary: "inc", description: "increment(0)"),
            state: ReMonitorRecord.State(state: "{ value: 42 }", diff: "+ { value: 42 }\n- { value: 41 }")
        ),
        ReMonitorRecord(
            date: Date(),
            action: ReMonitorRecord.Action(summary: "dec", description: "increment(0)"),
            state: ReMonitorRecord.State(state: "{ value: 41 }", diff: "+ { value: 41 }\n- { value: 42 }")
        ),
    ]
    static var previews: some View {
        MonitorView(records: $records)
    }
}
