//
//  CoverLetterList.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/05.
//
//  자소서 항목 기술하는 페이지

import SwiftUI

struct CoverletterList: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @ObservedObject var openAPIViewModel = OpenAPIViewModel()
    @ObservedObject var speechToTextViewModel = SpeechToTextViewModel()
    
    @State var index = 0
    @State var isDoneAll = false
    @State private var selection: Int? = nil
    
    @State private var wordCount: Int = 0
    @State private var lastText = ""
    
    var body: some View {
        ZStack{
            NavigationLink("", destination: ExpectedQuestion(openAPIViewModel: openAPIViewModel, speechToTextViewModel: speechToTextViewModel), isActive: $isDoneAll)
            
            if openAPIViewModel.isLoading {
                if !isDoneAll{
                LoadingView()
                    .onDisappear {
                            if index <= 3 {
                                dataManager.queryString.append(openAPIViewModel.resultTexts[1])
                            }
                        }
                    }
            }
            else {
                GeometryReader { screen in
                    
                    HStack { //가장 우측 프로그레스 바 추가 예정
                        VStack (alignment: .leading){
                            //프로그레스 바 제외 모든 요소의 정렬
                            
                            //페이지 타이틀
                            VStack (alignment: .leading){
                                Text("자소서 제출")
                                    .font(.system(size: 32, weight: .bold))
                                Text("내용 작성")
                                    .font(.system(size: 20, weight: .medium))
                            }
                            .foregroundColor(Color.primaryBlue)
                            .padding(EdgeInsets(top: screen.size.height*0.025, leading: screen.size.width*0.05, bottom: 20, trailing: 30))
                            
                            
                            VStack{
                                ZStack{
                                    
                                    //흰색 배경
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .frame(width: screen.size.width*0.9, height: screen.size.height*0.75)
                                    
                                    VStack (alignment: .leading){
                                    
        //이슈 11번 수정사항 시작 여기부터
                                        //자소서 항목 질문 1~4
                                        ScrollView {
                                            Text(dataManager.jobQuestion[index])
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.primaryBlue)
                                                .frame(maxWidth: screen.size.width*0.8, maxHeight: screen.size.height*0.3)
                                        }
                                        .padding(.top, screen.size.height*0.03)
                                
                                
                                        //VStack (alignment: .center){
                                
                                        Divider()
                                            .frame(width: screen.size.width*0.8)
                                            .background(Color.blue)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                
                                        //Text 입력 창
                                        // $dataManager.jobAnswer[index]
                                        TextEditor(text: $dataManager.jobAnswer[index])
                                            .onChange(of: dataManager.jobAnswer[index]){ text in
                                              // let text = $statement
                                                wordCount = text.count
                                        
                                                if wordCount <= 1000 {
                                                    lastText = text
                                                } else {
                                                    self.dataManager.jobAnswer[index] = lastText
                                                }
                                        
                                            }
                                            .cornerRadius(15)
                                            .frame(width: screen.size.width*0.8, height: screen.size.height*0.5)
                                            //.background(Color.lightGray)
                                
                                        Text("\(wordCount)/1000 ")
                                            .font(.headline)
                                            .foregroundColor(.secondary)
                                            .padding(.leading)
                                       //}
   //이슈 11번 수정사항                                     
                                    }
                                    
                                }
                                .padding()
                                
                                
                                HStack(spacing: 16) {
                                    
                                    Button {
                                        if index <= 0 {
                                            dismiss()
                                        } else {
                                            index = index - 1
                                        }
                                    } label: {
                                        Text("이전")
                                    }
                                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                                    
                                    
                                    
                                    if index >= 3 {
                                        //                                    Button(action: {
                                        //                                        selection = 0
                                        //                                        openAPIViewModel.questionText = dataManager.jobAnswer[index]
                                        //                                         openAPIViewModel.submitQuestion()
                                        //                                        index += 1
                                        //                                    }) {
                                        //                                        Text("제출하기")
                                        //                                            .padding()
                                        //                                            .background(Color.primaryBlue)
                                        //                                            .foregroundColor(.white)
                                        //                                            .cornerRadius(10)
                                        //                                    }
                                        //                                    if #available(iOS 16.0, *) {
                                        //                                        NavigationLink("", destination: ExpectedQuestion(), tag: 0, selection: $selection)
                                        //                                    } else {
                                        //                                        NavigationLink("", destination: ExpectedQuestion(), isActive: Binding.constant(selection == 0))
                                        //                                    }
                                        // 제출하기 버튼
                                        Button {
                                            isDoneAll = true
                                            openAPIViewModel.questionText = dataManager.queryString
                                            openAPIViewModel.submitQuestion()
                                            
                                        } label: {
                                            Text("제출하기")
                                        }
                                    } else {
                                        // 0 1 2 인덱스 뷰 다음
                                        Button {
                                            openAPIViewModel.questionText = dataManager.jobAnswer[index]
                                            openAPIViewModel.summarizeAnswer()
                                            index += 1
                                        } label: {
                                            Text("다음 질문으로 넘어가기")
                                        }
                                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    .frame(width: screen.size.width, height: screen.size.height)
                }
                .background(Color.blueBackground)
            }
        }
    }
}

struct CoverletterList_Previews: PreviewProvider {
    static var previews: some View {
        CoverletterList()
    }
}

