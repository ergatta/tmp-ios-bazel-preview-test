//
//  BrazeManager.swift
//  airborne
//
//  Created by Neel Mistry on 7/22/22.
//

import BrazeKit
import BrazeUI
import CryptoKit
import Foundation

class BrazeManager {
    // MARK: Singleton
    static let shared = BrazeManager()

    // MARK: Properties
    private let apiKey = Bundle.main.infoDictionary!["BRAZE_API_KEY"] as? String ?? ""
    private let endpoint = Bundle.main.infoDictionary!["BRAZE_ENDPOINT"] as? String ?? ""
    let braze: Braze

    // MARK: Initializer
    init() {
        let configuration = Braze.Configuration(
            apiKey: apiKey,
            endpoint: endpoint
        )

        configuration.logger.level = .info

        let braze = Braze(configuration: configuration)
        self.braze = braze
    }

    // MARK: Functions

    /// This function creates a unique external ID that is required by Braze
    /// Use this documentation to read more about it. https://www.notion.so/ergatta/Braze-External-ID-Design-cfc8758b52a242e9b5c055b4e5a3be03
    /// - Parameter userId: The current user's Ergatta ID
    /// - Returns: A hashed ID
    func externalId(userId: Int) -> String? {
        guard let data = "user-\(userId)".data(using: .utf8) else { return nil }

        let hashed = Insecure.SHA1.hash(data: data)
        let hashedString = hashed.compactMap { String(format: "%02x", $0) }.joined()
        return hashedString
    }

    func changeUser(_ id: Int) {
        #if RELEASE
        guard let externalId = externalId(userId: id) else { return }
        braze.changeUser(userId: externalId)
        UserDefaults.standard.set(true, forKey: "brazeExternalIDSet")
        #endif
    }

    /// The following functions are examples of how we can send data
    func logUserEmailAttributes(email: String) {
        #if RELEASE
        let brazeUser = braze.user
        brazeUser.set(email: email)
        #endif
    }

    func sendCustomStringAttribute(key: String, value: String) {
        #if RELEASE
        let brazeUser = braze.user
        brazeUser.setCustomAttribute(key: key, value: value)
        #endif
    }

    func sendCustomEvent(name: String) {
        #if RELEASE
        braze.logCustomEvent(name: name)
        #endif
    }
}

// MARK: BrazeInAppMessageUIDelegate
/// Link to in app messaging docs: https://braze-inc.github.io/braze-swift-sdk/documentation/brazeui/brazeinappmessageuidelegate/
extension BrazeManager: BrazeInAppMessageUIDelegate {

    // TODO: This is a sample delegate function so the extension is not empty. Remove once we add actual functionality 
    func inAppMessage(_ ui: BrazeInAppMessageUI, prepareWith context: inout BrazeInAppMessageUI.PresentationContext) {
        print("Implement if you want to do something before the message is shown")
    }
}
