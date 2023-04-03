//
//  Question.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/02.
//

import SwiftUI

struct CircleStyle: ButtonStyle {
    @Binding var isPressed : Bool
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        ZStack{
            Circle()
                .fill(Color.primaryBlue)
                .opacity(0.10)
                .frame(width: 160, height: 160)
                .scaleEffect(isPressed ? 1.5 : 1)
                .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                //.animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: true))
            
            Circle()
                .fill(Color.primaryBlue)
                .opacity(0.20)
                .frame(width: 160, height: 160)
                .scaleEffect(isPressed ? 1.25 : 1)
                .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                //.animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false).speed(1))
                
            Circle()
                .fill(Color.primaryBlue)
                .overlay(
                    Image(isPressed ? "stop" :"microphone")
                )
                .frame(width: 160, height: 160)
        }
    }
}

/*
struct RecordStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        ZStack {
            
            Circle()
                .fill(Color.primaryBlue)
                .frame(width: 160, height: 160)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .frame(width: 130, height: 130)
        }
    }
}
 */

struct ExpectedQuestion: View {
    @State var isPressed = false
    
    var body: some View {
        
        VStack (alignment: .center){
            QuestionList()
    
            Button(action : {
                isPressed.toggle()
            }){
                
            }
            .buttonStyle(CircleStyle(isPressed: $isPressed))
            .frame(width: 160, height: 160)
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 100, trailing: 0))
            
            
        }
        .background(Color.blueBackground)
    }
}

struct ExpectedQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ExpectedQuestion()
    }
}
