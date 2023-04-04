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
                .font(.title)
                .padding()
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
            HStack {
                
                Button {
                    currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
                Text(currentDate.formatted(date: .abbreviated, time: .shortened))
                
                Button {
                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
            }
        }
    }
}
