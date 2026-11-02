//
//  Weather_NowApp.swift
//  Weather Now
//
//  Created by Dmitrii Pogonia on 01.04.2024.
//

import SwiftUI
import SwiftData

@main
struct Weather_NowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
