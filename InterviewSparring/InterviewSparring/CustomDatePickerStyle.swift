//
//  CustomDatePickerStyle.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//
import SwiftUI

struct CustomDatePickerStyle: DatePickerStyle {
    @State private var currentDate = Date()
    @available(macOS 13.0, *)
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .font(Font.Job.title3)
            
        }
    }
}

