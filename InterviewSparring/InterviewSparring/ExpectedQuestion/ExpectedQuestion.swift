//
//  Question.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/02.
//
// 예상 질문을 음성으로 답변할 수 있는 페이지
// 녹음 버튼 제외 상단부분은 QuestionList.swift에 기술되어 있습니다.
// 필요 기능 : 녹음 버튼, 챗gpt에게 받은 질문을 띄우기, 이퀄라이저 효과


import SwiftUI

struct CircleStyle: ButtonStyle {
    @Binding var isPressed : Bool
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        VStack{
            ZStack{
                Circle() //가장 바깥 원
                    .fill(Color.primaryBlue)
                    .opacity(0.10)
                    .scaleEffect(isPressed ? 1.5 : 1)
                    .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                    .frame(width: 160, height: 160)
                
                Circle() //중간 원
                    .fill(Color.primaryBlue)
                    .opacity(0.20)
                    .scaleEffect(isPressed ? 1.25 : 1)
                    .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                    .frame(width: 160, height: 160)
                
                
                Circle() //마이크 이미지 버튼
                    .fill(Color.primaryBlue)
                    .overlay(
                        Image(isPressed ? "stop" :"microphone")
                    )
                    .frame(width: 160, height: 160)
            }
            Text(isPressed ? "답변이 진행중 입니다" : " ")
                .font(.system(size: 20))
                .padding(20)
                .foregroundColor(Color.primaryBlue)
            
        }
    }
}
struct RecordStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        ZStack {
            
            Circle()
                .fill(Color.primaryBlue)
                .frame(width: 160, height: 160)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
        }
    }
}
struct ExpectedQuestion: View {
    @State var isPressed = false
    @State var questionCount = 0 // 예상질문번호 넘버링
    @State var quitRecordCount = 0 //녹음 완료 횟수 카운드
    
    var body: some View {
        GeometryReader { screen in
            VStack (alignment: .center){
                QuestionList(isPressed: $isPressed, questionCount: $questionCount)
                
                Button(action : {
                    isPressed.toggle()
                    //음성녹음 버튼 press시 질문 넘버링 증가
                    if(isPressed == true){
                        if(questionCount <= 4){ //4번째 질문 카운트까지 넘버링 증가
                            questionCount = questionCount + 1
                        }
                        else { //질문 카운트가 4 초과하는 경우
                            questionCount = 4
                        }
                    }
                    else{
                        quitRecordCount = quitRecordCount + 1
                        
                        if(quitRecordCount == 4){
                            // 피드백 생성 로딩화면으로 이동
                        }
                        
                    }
                    
                }){
                    
                }
                .buttonStyle(CircleStyle(isPressed: $isPressed))
                .padding(EdgeInsets(top: screen.size.height*0.2, leading: 0, bottom: screen.size.height*0.025, trailing: 0))
                
                
                
            }
            .background(Color.blueBackground)
        }
    }
}

struct ExpectedQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ExpectedQuestion()
    }
}
