//
//  CustomTextFieldStyle.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.Job.headline2)
            .frame(width: 175, alignment: .center)
            .textFieldStyle(.plain)
            .padding(EdgeInsets(top: 10, leading: 31, bottom: 10, trailing: 31))
            .background(Color.white)
            .cornerRadius(20)
    }
}

//extension NSTextField {
//    open override var focusRingType: NSFocusRingType {
//        get { .none }
//        set { }
//    }
//}
