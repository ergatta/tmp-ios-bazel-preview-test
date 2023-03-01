//
//  View.swift
//  airborne
//
//  Created by Jackie Myrose on 8/30/22.
//

import Foundation
import SwiftUI
import FirebaseAnalytics

extension View {
    func navigationLinkOnTap(eventName: String?) -> some View {
        simultaneousGesture(TapGesture().onEnded {
            if let eventName = eventName {
                logEvent(event: UIEvent(id: eventName, component: .Button, action: .Tap))
            }
        })
    }
}

private func logScreenView(name: String,
                           class: String = "View",
                           extraParameters: [String: Any] = [:]) {
    var parameters = extraParameters
    parameters[AnalyticsParameterScreenName] = name
    parameters[AnalyticsParameterScreenClass] = `class`
    Analytics.logEvent(AnalyticsEventScreenView, parameters: parameters)
}

struct LoggedAnalyticsModifier: ViewModifier {
    let screenName: String
    let screenClass: String
    let extraParameters: [String: Any]

    func body(content: Content) -> some View {
        content.onAppear {
            logScreenView(name: screenName, class: screenClass, extraParameters: extraParameters)
        }
    }
}
