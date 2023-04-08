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
    
    @State var index = 0
    @State var isDoneAll = false
    
    var body: some View {
        
        ZStack {
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
                                    //자소서 항목 질문 1~4
                                    Text(dataManager.jobQuestion[index])
                                        .font(.title3)
                                        .foregroundColor(Color.primaryBlue)
                                        .frame(maxHeight: screen.size.height*0.08)
                                    
                                    VStack (alignment: .center){
                                        
                                        Divider()
                                            .frame(width: screen.size.width*0.8)
                                            .background(Color.blue)
                                            .padding(.bottom, 10)
                                        
                                        //Text 입력 창
                                        TextEditor(text: $dataManager.jobAnswer[index])
                                            .cornerRadius(15)
                                            .frame(width: screen.size.width*0.8, height: screen.size.height*0.6)
                                            //.background(Color.lightGray)
                                        
                                    }
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
                                    
                                    if #available(iOS 16.0, *) {
                                        NavigationLink(value: 0) {
                                            Text("다음")
                                        }
                                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                                    } else {
                                        NavigationLink {
                                            ExpectedQuestion()
                                        } label: {
                                            Text("다음")
                                        }
                                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                                    }
                                } else {
                                    Button {
                                        index = index + 1
                                    } label: {
                                        Text("다음")
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

struct CoverletterList_Previews: PreviewProvider {
    static var previews: some View {
        CoverletterList()
    }
}

