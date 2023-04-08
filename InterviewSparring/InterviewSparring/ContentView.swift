//
//  ContentView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/03/28.
//

import SwiftUI
import CoreData



struct ContentView: View {
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        StartView()
            .environmentObject(dataManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
