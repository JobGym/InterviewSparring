//
//  DataManager.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import Foundation
import SwiftUI

class DataManager: ObservableObject {
    @Published var educationHistory = EducationHistory(educationType: "", location: "", name: "", major: "", minor: "", enterDate: Date(), graduateDate: Date())
    @Published var careers = [[Career]](repeating: [Career](), count: 1)
    @Published var qualification = Qualification(name: "", grade: "", getDate: Date(), authority: "")
    @Published var language = Language(language: "", name: "", grade: "", score: "", getDate: Date(), authority: "")
    
    @Published var jobSelection = JobQuestion.none
    @Published var jobQuestion = [String]()
    @Published var jobAnswer = [String](repeating: "", count: 4)
}
