//
//  EventAnalytics.swift
//  airborne
//
//  Created by Sebastian Helzer on 8/23/21.
//

import SwiftUI
import FirebaseAnalytics

extension View {
    func onTapGesture(count: Int = 1, perform: @escaping () -> Void, event: String, uiAction: UIAction = .Tap) -> some View {
        return self.onTapGesture(count: count, perform: {
            logEvent(event: UIEvent(id: event, component: .Button, action: uiAction))
            perform()
        })
    }
}

extension Button {
    init(action: @escaping () -> Void, label: @escaping () -> Label, event: String, uiAction: UIAction = .Tap) {
        self.init(action: {
            logEvent(event: UIEvent(id: event, component: .Button, action: uiAction))
            action()
        }, label: label)
    }

    init(action: @escaping () -> Void, label: @escaping () -> Label, event: UIEvent) {
        self.init(action: {
            logEvent(event: event)
            action()
        }, label: label)
    }
}

func logEvent(event: UIEvent, parameters: [String: Any]? = nil) {
    let eventString = event.toUniqueString()
    Analytics.logEvent(eventString, parameters: parameters)
}

func logError(context: String, parameters: [String: Any]? = nil) {
    let errorEventString = "error_\(context)"
    Analytics.logEvent(errorEventString, parameters: parameters)
}

extension UIEvent {
    func toUniqueString() -> String { // max of 40 chars
        return "\(id)_\(component.shortName)_\(action.shortName)"
    }
}

struct UIEvent {
    let id: String // max of 30 chars
    let component: UIComponent
    let action: UIAction
}

extension UIComponent {
    var shortName: String { // Max of 4 char
        switch self {
        case .Button: return "btn"
        case .Graph: return "grph"
        case .Tab: return "tab"
        case .TwoChoiceSlider: return "sld"
        case .View: return "view"
        case .Picker: return "pick"
        case .Drawer: return "draw"
        case .Notification: return "notification"
        case .State: return "state"
        }
    }
}

extension UIAction {
    var shortName: String { // Max of 4 char
        switch self {
        case .Drag: return "drag"
        case .Tap: return "tap"
        case .Toggle: return "tgl"
        case .Received: return "notification_received"
        case .Success: return "success"
        case .Failure: return "failure"
        case .FailureTwo: return "failure_two"
        }
    }
}

enum UIComponent {
    case Button
    case TwoChoiceSlider
    case Tab
    case Graph
    case View
    case Picker
    case Drawer
    case Notification
    case State
}

enum UIAction {
    case Tap
    case Toggle
    case Drag
    case Received
    case Success
    case Failure
    case FailureTwo
}
