//
//  WriteLanguageView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct WriteLanguageView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @Binding var language: Language
    
    let languages = [
        DropdownOption(key: "English", val: "영어"),
        DropdownOption(key: "Japanese", val: "일어"),
        DropdownOption(key: "Chinese", val: "중국어"),
        DropdownOption(key: "Spanish", val: "스페인어"),
        DropdownOption(key: "French", val: "프랑스어"),
        DropdownOption(key: "German", val: "독일어"),
        DropdownOption(key: "other", val: "기타")
    ]
    
    let languageTests = [
        DropdownOption(key: "English", val: "영어"),
        DropdownOption(key: "Japanese", val: "일어"),
        DropdownOption(key: "Chinese", val: "중국어"),
        DropdownOption(key: "Spanish", val: "스페인어"),
        DropdownOption(key: "French", val: "프랑스어"),
        DropdownOption(key: "German", val: "독일어"),
        DropdownOption(key: "other", val: "기타")
    ]
    
    var body: some View {
        ZStack (alignment: .trailing) {
            ProgressView(value: 285)
            
            VStack(spacing: 140) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("이력서 제출")
                        .font(Font.Job.title1)
                    Text("어학사항")
                        .font(Font.Job.headline1)
                }
                .foregroundColor(.primaryBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .center, spacing: 40) {
                    HStack(spacing: 40) {
                        HStack(spacing: 8) {
                            Text("언어")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            DropdownButton(displayText: $language.language, options: languages) { key in
                                self.language.language = key
                            }
                        }
                        HStack(spacing: 8) {
                            Text("시험")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $language.name)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                    }
                    .zIndex(1)
                    
                    HStack(spacing: 40) {
                        HStack(spacing: 8) {
                            Text("등급")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $language.grade)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        HStack(spacing: 8) {
                            Text("점수")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $language.score)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                    }
                    
                    HStack(spacing: 40) {
                        DatePicker(selection: $language.getDate, displayedComponents: .date) {
                            Text("취득/응시일")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                        }
                        .frame(width: 200)
                        
                        HStack(spacing: 8) {
                            Text("발급기관")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("XXXXX", text: $language.authority)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                HStack(spacing: 16) {
                    Button {
                        dismiss()
                    } label: {
                        Text("이전")
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    
                    if #available(macOS 13.0, *) {
                        //                    NavigationLink(value: dataManager.careers) {
                        //                        Text("다음")
                        //                    }
                        //                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    } else {
                        NavigationLink {
                            
                        } label: {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    }
                }
            }
            .padding(.horizontal, 80)
            .padding(.vertical, 63)
        }
    }
}

struct WriteLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        WriteLanguageView(language: .constant(Language(language: "", name: "", grade: "", score: "", getDate: Date(), authority: "")))
    }
}
