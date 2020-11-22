//
//  MonitorView.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift
import SwiftUI

struct MonitorView: View {
    @Binding var records: [Record]
    var body: some View {
        NavigationView {
            List(records) { record in
                Text(record.action.monitorString)
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
    }
}
