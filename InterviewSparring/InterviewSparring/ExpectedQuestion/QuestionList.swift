//
//  QuestionList.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/03.
//
//  예상질문 답변 페이지의 상단 부분 (녹음 버튼 제외)
//  예상질문을 띄워야하는 부분

import SwiftUI


struct QuestionList: View {
    @Binding var isPressed : Bool
    
    var body: some View {
        
        GeometryReader { screen in
        VStack(alignment: .leading){
            
            //마지막 질문일 경우에 "다음질문" 말고 "결과화면"으로 이동하라고 고쳐야함.
            //Text ("답변이 완료되었다면 \n정지 버튼을 누르고 결과 화면으로 이동하세요.")
            Text(isPressed ? "답변이 완료되었다면 \n정지 버튼을 누르고 다음 질문으로 이동하세요." : "예상 면접 질문입니다. \n마이크를 통해 답변해보세요.")
                .padding(EdgeInsets(top: 60, leading: 50, bottom: 0, trailing: 30))
                .foregroundColor(Color.primaryBlue)
                .font(.system(size: 32, weight: .bold))
            
                ZStack (alignment: .trailing){
                    ZStack (alignment: .leading){
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primaryBlue)
                            .frame(width: (screen.size.width)*0.93, height: 200)
                            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                        
                        
                        HStack{
                            
                            Text("?")
                                .font(.system(size: 60, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 30))
                            
                            
                            //생성된 질문으로 교체
                            Text("iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요. \n 어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            
                        }
                    }
                    
                    Text("1/4") // 질문에 따라 숫자 변경
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: -65, leading: 0, bottom: 10, trailing: 60))
                }
            }
        }
    }
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList(isPressed: .constant(false))
    }
}
