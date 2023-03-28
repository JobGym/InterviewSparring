//
//  InterviewSparringApp.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/03/28.
//

import SwiftUI

@main
struct InterviewSparringApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
