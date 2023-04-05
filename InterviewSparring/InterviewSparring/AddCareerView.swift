//
//  AddCareerView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct AddCareerView: View {
    
    @State var career = Career(employmentForm: "", firm: "", department: "", period: "", isResignate: false, position: "", details: "")
    @Binding var isShowAddView: Bool
    @Binding var careerList: [[Career]]
    
    @State var enterDate = Date()
    @State var resignateDate = Date()
    
    let employmentForm = [
        DropdownOption(key: EmploymentForm.permanent.rawValue, val: EmploymentForm.permanent.rawValue),
        DropdownOption(key: EmploymentForm.contract.rawValue, val: EmploymentForm.contract.rawValue),
        DropdownOption(key: EmploymentForm.intern.rawValue, val: EmploymentForm.intern.rawValue),
        DropdownOption(key: EmploymentForm.dispatched.rawValue, val: EmploymentForm.dispatched.rawValue),
        DropdownOption(key: EmploymentForm.freelance.rawValue, val: EmploymentForm.freelance.rawValue),
        DropdownOption(key: EmploymentForm.part.rawValue, val: EmploymentForm.part.rawValue)
    ]
    @State var employmentDisplayText = ""
    
    var body: some View {
        VStack(spacing: 93) {
            Text("경력추가")
                .font(.Job.title1)
                .foregroundColor(.primaryBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 52)
                .padding(.top, 40)
            
            VStack(alignment: .center, spacing: 40) {
                HStack (spacing: 40){
                    HStack(spacing: 8) {
                        Text("고용형태")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        DropdownButton(displayText: $career.employmentForm, options: employmentForm) { key in
                            career.employmentForm = key
                        }
                    }
                    
                    HStack(spacing: 8) {
                        Text("회사명")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        TextField("회사", text: $career.firm)
                    }
                }
                .zIndex(1)
                
                HStack (spacing: 40){
                    HStack(spacing: 8) {
                        Text("부서명")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        TextField("XXXXXXX", text: $career.department)
                    }
                    
                    HStack(spacing: 8) {
                        Text("직책")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        TextField("????", text: $career.position)
                    }
                    HStack(spacing: 8) {
                        Text("업무내용")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        TextField("????", text: $career.details)
                    }
                }
                
                HStack (spacing: 40){
                    DatePicker(selection: $enterDate, displayedComponents: .date) {
                        Text("입사일")
                            .foregroundColor(.primaryBlue)
                            .font(Font.Job.title3)
                    }
                    .frame(width: 175)
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    
                    HStack(spacing: 8) {
                        Text("퇴사유무")
                            .font(.Job.title3)
                            .foregroundColor(.primaryBlue)
                        Button {
                            career.isResignate.toggle()
                        } label: {
                            Image(career.isResignate ? "check" : "unCheck")
                        }
                        .buttonStyle(.borderless)
                    }
                    
                    if career.isResignate {
                        DatePicker(selection: $resignateDate, displayedComponents: .date) {
                            Text("퇴사일")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                        }
                        .frame(width: 175)
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    }
                }
            }
            .textFieldStyle(CustomTextFieldStyle())
            
            HStack(spacing: 16) {
                Button {
                    print("취소")
                    isShowAddView.toggle()
                } label: {
                    Text("취소")
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: .systemCancel))
                Button {
                    print("등록")
                    let distanceMonth = Calendar.current.dateComponents([.month], from: enterDate, to: resignateDate).month
                    career.period = (distanceMonth?.formatted())!
                    careerList[0].insert(career, at: 0)
                    
                    isShowAddView.toggle()
                    
                } label: {
                    Text("등록")
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                
            }
            
            
            .padding(EdgeInsets(top: 0, leading: 161, bottom: 64, trailing: 161))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 1107, minHeight: 613)
        .background(Color.blueBackground)
    }
}
