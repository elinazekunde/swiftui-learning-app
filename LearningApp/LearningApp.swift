//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Elīna Zekunde on 15/03/2021.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
