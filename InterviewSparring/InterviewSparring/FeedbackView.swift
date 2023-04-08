//
//  FeedbackView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/01.
//

import SwiftUI

struct FeedbackView: View {
    @EnvironmentObject var dataManager: DataManager
    
    @State var index = 0
    @State var screenHeight:CGFloat = 0
    
    @State var isShowSummary = false
    var body: some View {
        ZStack {
            Color.blueBackground
                .ignoresSafeArea()
            VStack(spacing: 0) {
                
                //예상 질문 구역
                HStack {
                    Text("예상 질문")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primaryBlue)
                    Spacer()
                    Button {
                        isShowSummary.toggle()
                    } label: {
                        Text("요약 보기")
                            .underline()
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.blue)
                    }

                }
                .padding(.bottom, 16)
                
                ZStack(alignment: .topTrailing) {
                    ScrollView {
                        Text(dataManager.interviewQuestion[index])
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: true, vertical: false)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    .padding(.trailing, 20)
                    .padding(EdgeInsets(top: 24, leading: 54, bottom: 24, trailing: 52))
                    Text("\(index+1)/4")
                        .padding(.top, 13)
                        .padding(.trailing, 17)
                }
                .frame(maxWidth: .infinity, maxHeight: 110)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.primaryBlue)
                )
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 24)
                
                //답변과 피드백 구역
                HStack(spacing: 32) {
                    FeedbackContentView(title: "제출된 답변", content: dataManager.interviewAnswer[index])
                    
                    FeedbackContentView(title: "피드백", content: dataManager.interviewFeedback[index])
                }
                .padding(.bottom, 40)
                
                //하단 버튼 구역
                HStack(spacing: 16) {
                    //여백 통일을 위한 버튼
                    HStack{
                        Spacer()
                        
                        Button {
                            if index <= 0 {
                                
                            } else {
                                index = index - 1
                            }
                        } label: {
                            Text("이전 질문")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: index == 0 ? .gray : .primaryBlue))
                    }
                    
                    HStack {
                        Button {
                            if index >= 3 {
                                
                            } else {
                                index = index + 1
                            }
                        } label: {
                            Text("다음 질문")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: index == 3 ? .gray : .primaryBlue))
                        Spacer()
                        Button {
                        } label: {
                            Text("홈으로")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    }
                }
                
            }
            .padding(EdgeInsets(top: 58, leading: 80, bottom: 64, trailing: 80))
        }
    }
}

struct FeedbackContentView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primaryBlue)
            
            ScrollView {
                Text(content)
                    .font(.system(size: 17, weight: .regular))
                    .padding(EdgeInsets(top: 20, leading: 28, bottom: 20, trailing: 28))
                    .lineSpacing(5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
