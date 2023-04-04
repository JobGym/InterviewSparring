//
//  WriteEducationView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//

import SwiftUI

struct WriteEducationView: View {
    let options = [
        DropdownOption(key: "highschool", val: "고등학교"),
        DropdownOption(key: "college", val: "전문대학"),
        DropdownOption(key: "university", val: "대학교"),
        DropdownOption(key: "master", val: "대학원(석사)"),
        DropdownOption(key: "Doctor", val: "대학원(박사)"),
    ]
    
    let onSelect = { key in
        print(key)
    }
    
    @State var displayText = ""
    @State var department = ""
    @State var subDepartment = ""
    @State var enDate = Date()
    
    var body: some View {
        VStack(spacing: 140) {
            VStack(alignment: .leading, spacing: 0) {
                Text("이력서 제출")
                    .font(.system(size: 32, weight: .black))
                Text("학력사항(최종)")
                    .font(.system(size: 20, weight: .medium))
            }
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 40) {
                HStack (spacing: 40){
                    HStack(spacing: 8) {
                        Text("구분")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
                        DropdownButton(displayText: $displayText, options: options, onSelect: onSelect)
                    }
                    
                    HStack(spacing: 8) {
                        Text("소재지")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
                        DropdownButton(displayText: $displayText, options: options, onSelect: onSelect)
                    }
                    
                    HStack(spacing: 8) {
                        Text("학교명")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
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
                        Text("전공(고등학교 제외)")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
                        TextField("test", text: $department)
                            .font(.system(size: 20, weight: .regular))
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                    HStack(spacing: 8) {
                        Text("부전공(고등학교 제외)")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
                        TextField("test", text: $subDepartment)
                            .font(.system(size: 20, weight: .regular))
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                }
                
                HStack (spacing: 40){
                    
                    DatePicker(selection: $enDate, displayedComponents: .date) {
                        Text("입학년월")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .datePickerStyle(CustomDatePickerStyle())
                    
                    HStack(spacing: 8) {
                        
                        DatePicker(selection: .constant(Date()), label: {
                            Text("졸업년월")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .bold))
                        })
                    }
                    
                }
            }
            .padding(.horizontal, 156)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 16) {
                Button {
                    print("이전")
                } label: {
                    Text("이전")
                }
                .disabled(true)
//                .buttonStyle(CustomButtonStyle(backgroundColor: .gray))
                
                Button {
                    print("다음")
                } label: {
                    Text("다음")
                }
//                .buttonStyle(CustomButtonStyle(backgroundColor: .blue))
            }
            
        }
        .frame(minWidth: 1240, minHeight: 776)
        .padding(.horizontal, 80)
        .padding(.top, 63)
    }
}

struct WriteEducationView_Previews: PreviewProvider {
    static var previews: some View {
        WriteEducationView()
    }
}
