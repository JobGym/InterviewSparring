//
//  CoverletterVIew.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/04.
//
//  직군 선택 페이지

import SwiftUI

struct CoverletterView: View {
    @State var pressButton = false
    @State var jobSelection : String = ""
   
    
    var body: some View {
        
        GeometryReader { screen in 
            
            VStack(alignment: .leading) {
                
                VStack (alignment: .leading){
                    Text("자소서 제출")
                        .font(.system(size: 32, weight: .bold))
                    Text("직군 선택")
                        .font(.system(size: 20, weight: .medium))
                }
                .foregroundColor(Color.primaryBlue)
                .frame(width: screen.size.width*0.4)
                .padding(.top, screen.size.height*0.05)
                
                
                
                Spacer()
                
                VStack(alignment: .center){
                    
                    HStack{
                        Button {
                            jobSelection = "manager"
                        } label: {
                            Text("기획")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(Capsule().fill(Color.lightGray))
                        }
                        
                        
                        Button {
                            jobSelection = "developer"
                            
                        } label: {
                            Text("개발자")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(Capsule().fill(Color.lightGray))
                        }
                        
                        Button {
                            jobSelection = "designer"
                        } label: {
                            Text("디자이너")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(Capsule().fill(Color.lightGray))
                        }
                        
                        Button {
                            jobSelection = "researcher"
                        } label: {
                            Text("리서쳐")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(Capsule().fill(Color.lightGray))
                        }
                    }
                    .foregroundColor(Color.white)
                  
                    Spacer()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("이전")
                                .font(.system(size: 20))
                                .padding(.horizontal, 35)
                                .frame(height: 44)
                                .foregroundColor(Color.white)
                                .background(Capsule().fill(Color.primaryBlue))
                            
                        }
                        
                        Button {
                            
                        } label: {
                            Text("다음")
                                .font(.system(size: 20))
                                .padding(.horizontal, 35)
                                .frame(height: 44)
                                .foregroundColor(Color.white)
                                .background(Capsule().fill(Color.primaryBlue))
                            
                        }
                    }
                    .padding(.bottom, screen.size.height*0.025)
                    
                }
                .frame(width: screen.size.width, height: screen.size.height*0.55)
                
            }
            .frame(width: screen.size.width, height: screen.size.height)
            .background(Color.blueBackground)
        }
    }
}

struct CoverletterView_Previews: PreviewProvider {
    static var previews: some View {
        CoverletterView()
        //CoverletterView(jobSelection : "")
    }
}
