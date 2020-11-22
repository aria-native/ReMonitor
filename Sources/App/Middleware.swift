//
//  Middleware.swift
//  Monitor App
//
//  Created by knothole on 11/22/20.
//

import ReSwift

let loggingMiddleware: Middleware<AppState> = { _, _ in { next in { action in
    print(">  \(action)")
    next(action)
} } }
