//
//  SwordleApp.swift
//  Swordle
//
//  Created by Prasanna Swaminathan on 1/17/22.
//

import SwiftUI
import Firebase

@main
struct SwordleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onAppear {
                FirebaseApp.configure()
            }
        }
    }
}
