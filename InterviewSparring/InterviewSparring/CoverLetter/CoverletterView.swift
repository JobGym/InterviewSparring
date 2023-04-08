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
    @State var isDoneAll = false
    
    var body: some View {
        ZStack{
            NavigationLink("", destination: CoverletterList(), isActive: $isDoneAll)
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
                            
                            Button {
                                isDoneAll = true
                                dataManager.queryString.append("이력서\n최종 학력은 \(dataManager.educationHistory.location)을 소재로 한 \(dataManager.educationHistory.name)를 \(dataManager.educationHistory.graduateDate)년에 졸업함. \(dataManager.careers[0][0].employmentForm)이고 \(dataManager.careers[0][0].firm)에서 \(dataManager.careers[0][0].position)로 \(dataManager.careers[0][0].period)개월 근무한 경력자이며 현재는 \(dataManager.careers[0][0].isResignate ? "재직" : "퇴직" ) 중인 상태임. 주요 업무는 \(dataManager.careers[0][0].details)이었음. \(dataManager.qualification.name)을 \(dataManager.qualification.getDate)에 취득했음. \(dataManager.language.language)와 관련된 \(dataManager.language.name)를 \(dataManager.language.getDate)에 취득했음.")
                            } label: {
                                Text("다음")
                            }
                            
                            //                        if #available(iOS 16.0, *) {
                            //                            NavigationLink(value: dataManager.jobAnswer) {
                            //                                Text("다음")
                            //                            }
                            //                            .buttonStyle(CustomButtonStyle(backgroundColor: isButtonDisabled() ? .lightGray : .primaryBlue))
                            //                            .disabled(isButtonDisabled())
                            //                        } else {
                            //                            NavigationLink {
                            //                                CoverletterList()
                            //                            } label: {
                            //                                Text("다음")
                            //                            }
                            //                            .buttonStyle(CustomButtonStyle(backgroundColor: isButtonDisabled() ? .lightGray : .primaryBlue))
                            //                            .disabled(isButtonDisabled())
                            //                        }
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
