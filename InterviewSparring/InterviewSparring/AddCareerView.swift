//
//  AddCareerView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct AddCareerView: View {
    @State var career = Career(employmentForm: EmploymentForm.contract, firm: "", department: "", period: "", isResignate: false, position: "", details: "")
    @Binding var isShowAddView: Bool
    
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
        VStack {
            Text("경력추가")
                .font(.system(size: 32, weight: .black))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 52)
                .padding(.top, 40)
            
            VStack(spacing: 140) {
                VStack(alignment: .leading) {
                    HStack (spacing: 40){
                        HStack(spacing: 8) {
                            Text("고용형태")
                            DropdownButton(displayText: $employmentDisplayText, options: employmentForm)
                        }
                        
                        HStack(spacing: 8) {
                            Text("회사명")
                            TextField("회사", text: $career.firm)
                        }
                        
                        HStack(spacing: 8) {
                            Text("부서명")
                            Button {
                                print("학교 검색 팝업 띄우기")
                            } label: {
                                HStack {
                                    Text("OO대학교")
                                        .font(.system(size: 20, weight: .regular))
                                    Image("search")
                                        .frame(width: 18, height: 18)
                                }
                                .padding()
                            }
                            .buttonStyle(.borderedProminent)
                            
                        }
                    }
                    HStack (spacing: 40){
                        HStack(spacing: 8) {
                            Text("부서명")
                            TextField("test", text: $career.department)
                        }
                        
                        HStack(spacing: 8) {
                            Text("직책")
                            TextField("test", text: $career.position)
                        }
                    }
                    
                    HStack (spacing: 40){
                        HStack(spacing: 8) {
                            Text("입사일")
                            DatePicker(selection: .constant(Date()), label: { Text("입학년월") })
                        }
                        
                        HStack(spacing: 8) {
                            Text("퇴사유무")
                            
                        }
                        
                        if career.isResignate {
                            HStack(spacing: 8) {
                                Text("입사일")
                                DatePicker(selection: .constant(Date()), label: { Text("입학년월") })
                            }
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    Button {
                        print("취소")
                        isShowAddView.toggle()
                    } label: {
                        Text("취소")
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .orange))
                    Button {
                        print("등록")
                        isShowAddView.toggle()
                    } label: {
                        Text("등록")
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .blue))
                    
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: 161, bottom: 64, trailing: 161))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 1107, minHeight: 613)
    }
}

struct AddCareerView_Previews: PreviewProvider {
    static var previews: some View {
        AddCareerView(isShowAddView: .constant(true))
    }
}
