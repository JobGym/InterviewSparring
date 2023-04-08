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

    init(){
            UINavigationBar.setAnimationsEnabled(false)
        }
    
    @StateObject var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dataManager)
        }
    }
}
