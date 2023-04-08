//
//  CoverletterVIew.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/04.
//
//  직군 선택 페이지

import SwiftUI

struct CoverletterView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    
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
                            dataManager.jobSelection = JobQuestion.projectManager
                            dataManager.jobQuestion = dataManager.jobSelection.fetchQuestion()
                        } label: {
                            Text("기획")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(isSameJobSelection(jobSelection: JobQuestion.projectManager) ? Capsule().fill(Color.primaryBlue) : Capsule().fill(Color.lightGray))
                        }
                        
                        
                        Button {
                            dataManager.jobSelection = JobQuestion.developer
                            dataManager.jobQuestion = dataManager.jobSelection.fetchQuestion()
                        } label: {
                            Text("개발자")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(isSameJobSelection(jobSelection: JobQuestion.developer) ? Capsule().fill(Color.primaryBlue) : Capsule().fill(Color.lightGray))
                        }
                        
                        Button {
                            dataManager.jobSelection = JobQuestion.designer
                            dataManager.jobQuestion = dataManager.jobSelection.fetchQuestion()
                        } label: {
                            Text("디자이너")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(isSameJobSelection(jobSelection: JobQuestion.designer) ? Capsule().fill(Color.primaryBlue) : Capsule().fill(Color.lightGray))
                        }
                        
                        Button {
                            dataManager.jobSelection = JobQuestion.researcher
                            dataManager.jobQuestion = dataManager.jobSelection.fetchQuestion()
                        } label: {
                            Text("리서쳐")
                                .font(.system(size: 20))
                                .padding(.horizontal, 30)
                                .frame(height: 44)
                                .background(isSameJobSelection(jobSelection: JobQuestion.researcher) ? Capsule().fill(Color.primaryBlue) : Capsule().fill(Color.lightGray))
                        }
                    }
                    .foregroundColor(Color.white)
                  
                    Spacer()
                    
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("이전")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                        
                        if #available(iOS 16.0, *) {
                            NavigationLink(value: dataManager.jobAnswer) {
                                Text("다음")
                            }
                            .buttonStyle(CustomButtonStyle(backgroundColor: isButtonDisabled() ? .lightGray : .primaryBlue))
                            .disabled(isButtonDisabled())
                        } else {
                            NavigationLink {
                                CoverletterList()
                            } label: {
                                Text("다음")
                            }
                            .buttonStyle(CustomButtonStyle(backgroundColor: isButtonDisabled() ? .lightGray : .primaryBlue))
                            .disabled(isButtonDisabled())
                        }
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    .padding(.bottom, screen.size.height*0.025)
                    
                }
                .frame(width: screen.size.width, height: screen.size.height*0.55)
                
            }
            .frame(width: screen.size.width, height: screen.size.height)
            .background(Color.blueBackground)
        }
    }
    func isSameJobSelection(jobSelection: JobQuestion) -> Bool {
        if dataManager.jobSelection == jobSelection {
            return true
        } else {
            return false
        }
    }
    func isButtonDisabled() -> Bool {
        if dataManager.jobSelection == JobQuestion.none {
            return true
        } else {
            return false
        }
    }
}

struct CoverletterView_Previews: PreviewProvider {
    static var previews: some View {
        CoverletterView()
        //CoverletterView(jobSelection : "")
    }
}
