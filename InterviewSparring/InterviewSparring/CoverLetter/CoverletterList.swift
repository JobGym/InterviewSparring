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
    @ObservedObject var questionViewModel = OpenAPIViewModel()
    @ObservedObject var speechToTextViewModel = SpeechToTextViewModel()
    
    @State var index = 0
    @State var isDoneAll = false
    @State private var selection: Int? = nil
    
    @State private var wordCount: Int = 0
    @State private var lastText = ""
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack{
            NavigationLink("", destination: ExpectedQuestion(passedAPIViewModel: openAPIViewModel), isActive: $isDoneAll)
            
            ProgressView(value: 6 + CGFloat(index))
            
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
                        .padding(.top, 63)
                        
                        
                        VStack{
                            ZStack{
                                VStack (alignment: .leading){
                                    //자소서 항목 질문 1~4
                                    ScrollView {
                                        Text(dataManager.jobQuestion[index])
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color.primaryBlue)
                                            .padding(.top, 10)
                                    }
                                    .frame(height: 100)
                            
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
                                    Text("\(wordCount)/1000 ")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                        .padding(.leading)
                                        .padding(.bottom, 20)
                                }
                                
                            }
                            .padding(.horizontal, 20)
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        
                        HStack(spacing: 16) {
                            
                            Spacer()
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
                                    wordCount = 0
                                    openAPIViewModel.questionText = dataManager.jobAnswer[index]
                                    openAPIViewModel.summarizeAnswer()
                                    index += 1
                                } label: {
                                    Text("다음 질문으로 넘어가기")
                                }
                                .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                            }
                            Spacer()
                        }
                        .padding(.bottom, 63)
                    }
                    .padding(.horizontal, 40)
                }
            }
        }
        .ignoresSafeArea()
        .background(Color.blueBackground)
        .navigationBarHidden(true)
    }
}

struct CoverletterList_Previews: PreviewProvider {
    static var previews: some View {
        CoverletterList()
    }
}

