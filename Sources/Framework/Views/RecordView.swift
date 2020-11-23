//
//  RecordView.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import SwiftUI

struct RecordView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }

    var record: ReMonitorRecord
    @State var selectedIndex = 0

    var body: some View {
        Form {
            Section(header: Text("Action").foregroundColor(.secondary)) {
                Text(record.action.description)
                Text(dateFormatter.string(from: record.date))
            }
            Spacer().frame(height: 20)
            Section(header: Text("State").foregroundColor(.secondary)) {
                Picker("", selection: self.$selectedIndex) {
                    Text("diff").tag(0)
                    Text("full").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())

                if selectedIndex == 0 {
                    DiffView(content: .constant(record.state.diff))
                } else {
                    ScrollView {
                        Text(record.state.state ?? "nil")
                            .font(Font.system(.body, design: .monospaced))
                    }
                }
            }
        }.padding(10)
    }
}

struct StateView_Previews: PreviewProvider {
    static var record = ReMonitorRecord(
        date: Date(),
        action: ReMonitorRecord.Action(summary: "inc", description: "increment(0)"),
        state: ReMonitorRecord.State(state: "{ value: 42 }", diff: "+ { value: 42 }\n- { value: 41 }")
    )

    static var previews: some View {
        Group {
            RecordView(record: record)
            RecordView(record: record, selectedIndex: 1)
        }
    }
}
