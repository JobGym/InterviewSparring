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
                Circle()
                    .fill(Color.primaryBlue)
                    .opacity(0.10)
                    .scaleEffect(isPressed ? 1.5 : 1)
                    .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                    .frame(width: 160, height: 160)
                
                Circle()
                    .fill(Color.primaryBlue)
                    .opacity(0.20)
                    .scaleEffect(isPressed ? 1.25 : 1)
                    .animation(isPressed ? .easeInOut(duration: 1).repeatForever() : nil)
                    .frame(width: 160, height: 160)
                
                
                Circle()
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
//                .frame(width: 130, height: 130)
        }
    }
}
struct ExpectedQuestion: View {
    @EnvironmentObject var dataManager: DataManager
    @ObservedObject var passedAPIViewModel: OpenAPIViewModel
    @ObservedObject var openAPIViewModel = OpenAPIViewModel()
    @ObservedObject var speechToTextViewModel = SpeechToTextViewModel()

    @State var isPressed = false
    @State var recordCount = 0 //n번째 녹음
    @State var questionCount = 1 //n번째 질문
    
    @State var isDoneAll = false
    @State var isViewFullyLoaded = false
    
    var body: some View {

        ZStack {
            NavigationLink("", destination: FeedbackView(), isActive: $isDoneAll)
            if passedAPIViewModel.isLoading {
                LoadingView()
                    .onDisappear{
                        if !isViewFullyLoaded {
                            dataManager.interviewQuestion = passedAPIViewModel.resultTexts
                        }
                    }
            }
            else {
                if openAPIViewModel.isLoading{
                    SwiftUIView()
                }
                else {
                    VStack (alignment: .center){
                        QuestionList(isPressed: $isPressed, questionCount: $questionCount, recordCount: $recordCount)
                        
                        Button(action : {
                            isPressed.toggle()
                            isViewFullyLoaded = true
                            if(isPressed == true){
                                //녹음 시작
                                recordCount = recordCount + 1
                                speechToTextViewModel.startRecording()
                            }
                            else{
                                speechToTextViewModel.stopRecording()
                                dataManager.interviewAnswer[recordCount - 1] = speechToTextViewModel.text
                                openAPIViewModel.questionText.append(dataManager.interviewQuestion[recordCount])
                                openAPIViewModel.questionText.append("위 면접 질문에 대한 답변은 다음과 같아.")
                                openAPIViewModel.questionText.append(dataManager.interviewAnswer[recordCount - 1])
                                openAPIViewModel.submitAnswer()
                                //녹음 끝
                                if recordCount == 4 {
                                    dataManager.interviewAnswer[recordCount - 1] = speechToTextViewModel.text
                                    openAPIViewModel.questionText.append(dataManager.interviewQuestion[recordCount])
                                    openAPIViewModel.questionText.append("위 면접 질문에 대한 답변은 다음과 같아.")
                                    openAPIViewModel.questionText.append(dataManager.interviewAnswer[recordCount - 1])
                                    openAPIViewModel.submitAnswer()
                                    isDoneAll.toggle()
                                    questionCount = 4
                                }
                                else {
                                    questionCount = questionCount + 1
                                }
                            }
                            
                        }){
                            
                        }
                        .buttonStyle(CircleStyle(isPressed: $isPressed))
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 100, trailing: 0))
                        //            .frame(width: 160, height: 160)
                        
                    }
                }
            }
        }.background(Color.blueBackground)
    }
}

//struct ExpectedQuestion_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpectedQuestion()
//    }
//}
