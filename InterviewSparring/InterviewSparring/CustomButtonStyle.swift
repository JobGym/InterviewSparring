//
//  CustomButtonStyle.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    var backgroundColor: Color
    var cornerRadius: CGFloat = 46
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 12, leading: 32, bottom: 12, trailing: 32))
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            )
            .shadow(color: .black.opacity(0.15), radius: 16, y: 4)
    }
}
