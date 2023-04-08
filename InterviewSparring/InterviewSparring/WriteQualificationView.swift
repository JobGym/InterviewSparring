//
//  WriteQualificationView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct WriteQualificationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @Binding var qualification: Qualification
    let grades = [
        DropdownOption(key: "1", val: "1급"),
        DropdownOption(key: "2", val: "2급"),
        DropdownOption(key: "3", val: "3급"),
        DropdownOption(key: "2+", val: "2+급"),
        DropdownOption(key: "2-", val: "2-급"),
        DropdownOption(key: "3+", val: "3+급"),
        DropdownOption(key: "3-", val: "3-급"),
        DropdownOption(key: "4+", val: "4+급"),
        DropdownOption(key: "A", val: "A급"),
        DropdownOption(key: "B", val: "B급"),
        DropdownOption(key: "other", val: "기타")
    ]
    
    var body: some View {
        ZStack(alignment: .trailing) {
            ProgressView(value: 3)
            VStack(spacing: 140) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("이력서 제출")
                        .font(Font.Job.title1)
                    Text("자격사항")
                        .font(Font.Job.headline1)
                }
                .foregroundColor(.primaryBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .center, spacing: 40) {
                    HStack(spacing: 40) {
                        HStack(spacing: 8) {
                            Text("자격사항")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $qualification.name)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        HStack(spacing: 8) {
                            Text("등급")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            DropdownButton(displayText: $qualification.grade, options: grades) { key in
                                self.qualification.grade = key
                            }
                        }
                    }
                    .zIndex(1)
                    HStack(spacing: 40) {
                        DatePicker(selection: $qualification.getDate, displayedComponents: .date) {
                            Text("취득/응시일")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                        }
                        .frame(width: 200)
                        
                        HStack(spacing: 8) {
                            Text("발급기관")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $qualification.authority)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.horizontal, 40)
                
                HStack(spacing: 16) {
                    Button {
                        dismiss()
                    } label: {
                        Text("이전")
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    
                    if #available(iOS 16.0, *) {
                        NavigationLink(value: dataManager.language) {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    } else {
                        NavigationLink {
                            WriteLanguageView(language: $dataManager.language)
                        } label: {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 63)
        }
        .background(Color.blueBackground)
        .navigationBarHidden(true)
    }
}

struct WriteQualificationView_Previews: PreviewProvider {
    static var previews: some View {
        WriteQualificationView(qualification: .constant(Qualification(name: "", grade: "", getDate: Date(), authority: "")))
    }
}
