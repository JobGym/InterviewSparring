//
//  QuestionList.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/03.
//

import SwiftUI

struct QuestionList: View {
    var body: some View {
        VStack(alignment: .leading){
            
            //Text ("답변이 완료되었다면 \n정지 버튼을 누르고 결과 화면으로 이동하세요.")
            Text("예상 면접 질문입니다. \n마이크를 통해 답변해보세요")
                .padding(EdgeInsets(top: 60, leading: 50, bottom: 0, trailing: 30))
                .foregroundColor(Color.primaryBlue)
                .font(.system(size: 32, weight: .bold))
                .frame(width: 500, height: 180)
            
            ZStack (alignment: .leading){
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryBlue)
                    .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                
                HStack{
                    
                    Text("?")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 30))
                    
                    
                    //생성된 질문으로 교체
                    Text("iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요. \n 어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 30))
                    
                    Text("1/4") // 질문에 따라 숫자 변경
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: -30, leading: 330, bottom: 10, trailing: 30))
                    
                }
            }
        }
    }
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}
