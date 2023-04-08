//
//  Date+Extension.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/08.
//

import Foundation

extension Date {
    
    /// Date를 yyyy 형태의 String으로 변환해주는 함수입니다.
    func getYear() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy"
        
        return formatter.string(from: current)
    }
    /// Date를 yyyy.MM.dd 형태의 String으로 변환해주는 함수입니다.
    func getDate() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: current)
    }
}
