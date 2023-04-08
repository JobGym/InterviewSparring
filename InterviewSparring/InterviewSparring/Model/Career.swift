//
//  Career.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import Foundation

struct Career: Hashable, Identifiable {
    let id = UUID()
    var employmentForm: String
    var firm: String
    var department: String
    var period: String
    var isResignate: Bool
    var position: String
    var details: String
}
