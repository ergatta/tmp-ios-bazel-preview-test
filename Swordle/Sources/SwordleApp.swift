//
//  SwordleApp.swift
//  Swordle
//
//  Created by Prasanna Swaminathan on 1/17/22.
//

import SwiftUI
import Firebase
import FirebaseAnalytics
import BrazeKit

@main
struct SwordleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onAppear {
                FirebaseApp.configure()
                BrazeManager.shared.braze.enabled = true
            }
        }
    }
}
