//
//  RecordView.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift
import SwiftUI

struct RecordView: View {
    @EnvironmentObject var environment: InspectorEnvironment
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }

    var record: Record
    var body: some View {
        GeometryReader { _ in
            Form {
                Section(header: Text("Action").foregroundColor(.secondary)) {
                    Text(environment.stringfy(action: record.action))
                    Text(dateFormatter.string(from: record.date))
                }
                Spacer().frame(height: 20)
                Section(header: Text("State").foregroundColor(.secondary)) {
                    Text(environment.stringfy(state: record.state))
                }
            }.padding(20)
        }
    }
}

struct StateView_Previews: PreviewProvider {
    struct SampleAction: Action, CustomStringConvertible {
        var description: String { "action" }
    }

    struct AppState: StateType, Codable {
        var counter: Int
    }

    static var record = Record(
        date: Date(),
        action: SampleAction(),
        state: AppState(counter: 42)
    )
    static var previews: some View {
        RecordView(record: record)
            .environmentObject(InspectorEnvironment())
    }
}
