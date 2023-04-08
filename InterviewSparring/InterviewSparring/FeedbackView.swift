//
//  FeedbackView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/01.
//

import SwiftUI

struct FeedbackView: View {
    
    @State var question = "iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요."
    @State var index = 0
    @State var screenHeight:CGFloat = 0
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
                        print("요약보기")
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
                        Text(question)
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
                .frame(maxWidth: .infinity, maxHeight: screenHeight/7)

                .foregroundColor(.white)
                
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.primaryBlue)
                )
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 24)
                
                //답변과 피드백 구역
                HStack(spacing: 32) {
                    VStack(alignment: .leading, spacing: 16){
                        Text("제출된 답변")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primaryBlue)
                        
                        ScrollView {
                            Text("testsetstesttestsetstes")
                                .font(.system(size: 17, weight: .regular))
                                .padding(EdgeInsets(top: 20, leading: 28, bottom: 20, trailing: 28))
                                .lineSpacing(5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .frame(minWidth: 524, maxWidth: .infinity, minHeight: 315, maxHeight: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 16){
                        Text("피드백")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primaryBlue)
                        
                        ScrollView {
                            Text("답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로")
                                .font(.system(size: 17, weight: .regular))
                                .padding(EdgeInsets(top: 20, leading: 28, bottom: 20, trailing: 28))
                                .lineSpacing(5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .frame(minWidth: 524, maxWidth: .infinity, minHeight: 315, maxHeight: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                }
                .padding(.bottom, 40)
                
                //하단 버튼 구역
                HStack(spacing: 16) {
                    //여백 통일을 위한 버튼
                    HStack{
                        Spacer()
                        
                        Button {
                            print("이전 질문")
                        } label: {
                            Text("이전 질문")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: index == 0 ? .gray : .primaryBlue))
                    }
                    
                    HStack {
                        Button {
                            print("다음 질문")
                        } label: {
                            Text("다음 질문")
                        }
                        Spacer()
                        Button {
                            print("홈으로")
                        } label: {
                            Text("홈으로")
                        }
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                }
                
            }
            .padding(EdgeInsets(top: 58, leading: 80, bottom: 64, trailing: 80))
        .frame(minWidth: 1240, minHeight: 776)
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
