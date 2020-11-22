//
//  CounterExampleView.swift
//  Monitor App
//
//  https://github.com/ReSwift/ReSwift/issues/424
//

import ReSwift
import SwiftUI

// MARK: ReSwift Example Setup

struct AppState: StateType {
    var counter: Int = 0
}

struct CounterActionIncrease: Action, CustomStringConvertible {
    var description: String { "increase" }
}

struct CounterActionDecrease: Action, CustomStringConvertible {
    var description: String { "descrease" }
}

func counterReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }

    return state
}

let mainStore = Store<AppState>(
    reducer: counterReducer,
    state: nil,
    middleware: [ReMonitor.default.monitor()]
)

// MARK: CounterExampleView

struct CounterExampleView: View {
    // MARK: Private Properties

    @ObservedObject private var state = ObservableState(store: mainStore)

    // MARK: Body

    var body: some View {
        VStack {
            Text(String(state.current.counter))
            Button(action: state.dispatch(CounterActionIncrease())) {
                Text("Increase")
            }
            Button(action: state.dispatch(CounterActionDecrease())) {
                Text("Decrease")
            }
        }
    }
}

// MARK: ObservableState

public class ObservableState<T>: ObservableObject where T: StateType {
    // MARK: Public properties

    @Published public var current: T

    // MARK: Private properties

    private var store: Store<T>

    // MARK: Lifecycle

    public init(store: Store<T>) {
        self.store = store
        current = store.state

        store.subscribe(self)
    }

    deinit {
        store.unsubscribe(self)
    }

    // MARK: Public methods

    public func dispatch(_ action: Action) {
        store.dispatch(action)
    }

    public func dispatch(_ action: Action) -> () -> Void {
        {
            self.store.dispatch(action)
        }
    }
}

extension ObservableState: StoreSubscriber {
    // MARK: - <StoreSubscriber>

    public func newState(state: T) {
        DispatchQueue.main.async {
            self.current = state
        }
    }
}
