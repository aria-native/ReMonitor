//
//  DiffView.swift
//  ReMonitor
//
//  Created by knothole on 11/23/20.
//

import HighlightedTextEditor
import SwiftUI

// swiftlint:disable force_try
let addedLine = try! NSRegularExpression(pattern: "^ *\\+.*$", options: [.anchorsMatchLines])
let removedLine = try! NSRegularExpression(pattern: "^ *-.*$", options: [.anchorsMatchLines])
// swiftlint:enable force_try

#if os(macOS)
    typealias UXColor = NSColor
    typealias UXFont = NSFont
#else
    typealias UXColor = UIColor
    typealias UXFont = UIFont
#endif

extension Array where Element: Equatable {
    var uniques: Array {
        var buffer = Array()
        var previous: Element?
        for elem in self {
            if elem != previous {
                buffer.append(elem)
            }
            previous = elem
        }
        return buffer
    }
}

struct DiffView: View {
    let kDiffContext = 1

    @Binding var content: String?
    var diff: Binding<String> {
        Binding(
            get: {
                let lines = (content ?? "nil").split(whereSeparator: \.isNewline)
                let interest: Set<Int> =
                    Set(lines
                        .enumerated()
                        .compactMap { index, line in
                            let str = line.trimmingCharacters(in: .whitespaces)
                            if str.hasPrefix("+") || str.hasPrefix("-") {
                                return index
                            } else {
                                return nil
                            }
                        })
                return lines
                    .enumerated()
                    .compactMap { index, line in
                        if (index - kDiffContext ... index + kDiffContext).contains(where: { interest.contains($0) }) {
                            return String(line)
                        } else {
                            return "..."
                        }
                    }
                    .uniques
                    .joined(separator: "\n")
            },
            set: { _ in }
        )
    }

    private let rules: [HighlightRule] = [
        HighlightRule(pattern: addedLine, formattingRules: [
            TextFormattingRule(key: .foregroundColor, value: UXColor.systemGreen),
        ]),
        HighlightRule(pattern: removedLine, formattingRules: [
            TextFormattingRule(key: .foregroundColor, value: UXColor.systemRed),
        ]),
    ]

    var body: some View {
        HighlightedTextEditor(
            text: diff,
            highlightRules: rules
        ).defaultFont(UXFont.monospacedSystemFont(ofSize: 0.0, weight: .regular))
    }
}

struct DiffView_Previews: PreviewProvider {
    static var previews: some View {
        DiffView(content:
            .constant("""
            Lorem ipsum dolor sit amet, consectetur adipiscing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
            nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
            deserunt mollit anim id est laborum.
             + bar
             - baz
            Lorem ipsum dolor sit amet, consectetur adipiscing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
            nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
            deserunt mollit anim id est laborum.
            """))
    }
}
