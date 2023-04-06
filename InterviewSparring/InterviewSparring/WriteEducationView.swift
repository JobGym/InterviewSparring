//
//  WriteEducationView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//

import SwiftUI

struct WriteEducationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @Binding var educationHistory: EducationHistory
    
    let educationTypes = [
        DropdownOption(key: "고등학교", val: "고등학교"),
        DropdownOption(key: "전문대학", val: "전문대학"),
        DropdownOption(key: "대학교", val: "대학교"),
        DropdownOption(key: "대학원(석사)", val: "대학원(석사)"),
        DropdownOption(key: "대학원(박사)", val: "대학원(박사)"),
    ]
    let locations = [
        DropdownOption(key: "Seoul", val: "서울"),
        DropdownOption(key: "Gyeonggi", val: "경기"),
        DropdownOption(key: "Incheon", val: "인천"),
        DropdownOption(key: "Gangwon", val: "강원"),
        DropdownOption(key: "Chungbuk", val: "충북"),
        DropdownOption(key: "Chungnam", val: "충남"),
        DropdownOption(key: "Daejeon", val: "대전"),
        DropdownOption(key: "Sejong", val: "세종"),
        DropdownOption(key: "busan", val: "부산"),
        DropdownOption(key: "Ulsan", val: "울산"),
        DropdownOption(key: "Daegu", val: "대구"),
        DropdownOption(key: "Gyeongbuk", val: "경북"),
        DropdownOption(key: "Gyeongnam", val: "경남"),
        DropdownOption(key: "Jeonbuk", val: "전북"),
        DropdownOption(key: "Jeonnam", val: "전남"),
        DropdownOption(key: "Gwangju", val: "광주"),
        DropdownOption(key: "Jeju", val: "제주"),
        DropdownOption(key: "Overseas", val: "해외")
    ]
    var body: some View {
        
        ZStack(alignment: .trailing) {
            
            ProgressView(value: 0)
            
            VStack(spacing: 140) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("이력서 제출")
                        .font(Font.Job.title1)
                    Text("학력사항(최종)")
                        .font(Font.Job.headline1)
                }
                .foregroundColor(.primaryBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .center, spacing: 40) {
                    HStack (spacing: 40){
                        HStack(spacing: 8) {
                            Text("구분")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            DropdownButton(displayText: $educationHistory.educationType, options: educationTypes) { key in
                                self.educationHistory.educationType = key
                            }
                        }
                        
                        HStack(spacing: 8) {
                            Text("소재지")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            DropdownButton(displayText: $educationHistory.location, options: locations) { key in
                                self.educationHistory.location = key
                            }
                        }
                        
                        HStack(spacing: 8) {
                            Text("학교명")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                            TextField("OOO학교", text: $educationHistory.name)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                            //                        Button {
                            //                            print("학교 검색 팝업 띄우기")
                            //                        } label: {
                            //                            HStack {
                            //                                Text(educationHistory.name)
                            //                                    .font(Font.Job.headline2)
                            //                                Image("search")
                            //                                    .frame(width: 18, height: 18)
                            //                            }
                            //                            .padding()
                            //                        }
                            //                        .buttonStyle(.borderedProminent)
                            
                        }
                    }
                    .zIndex(1)
                    
                    
                    HStack (spacing: 40){
                        HStack(spacing: 8) {
                            HStack(spacing: 0) {
                                Text("전공")
                                    .font(Font.Job.title3)
                                Text("(고등학교 제외)")
                                    .font(Font.Job.headline1)
                            }
                            .foregroundColor(.primaryBlue)
                            TextField("OOOOOO", text: $educationHistory.major)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        
                        HStack(spacing: 8) {
                            HStack(spacing: 0) {
                                Text("부전공")
                                    .font(Font.Job.title3)
                                Text("(고등학교 제외)")
                                    .font(Font.Job.headline1)
                            }
                            .foregroundColor(.primaryBlue)
                            
                            TextField("OOOOOO", text: $educationHistory.minor)
                                .font(Font.Job.headline2)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                    }
                    .frame(minWidth: 719)
                    
                    HStack (spacing: 40){
                        
                        DatePicker(selection: $educationHistory.enterDate, displayedComponents: .date) {
                            Text("입학년월")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                        }
                        .frame(width: 175)
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                        
                        DatePicker(selection: $educationHistory.graduateDate, displayedComponents: .date) {
                            Text("졸업년월")
                                .foregroundColor(.primaryBlue)
                                .font(Font.Job.title3)
                        }
                        .frame(width: 175)
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                HStack(spacing: 16) {
                    Button {
                        dismiss()
                    } label: {
                        Text("이전")
                    }
                    .disabled(true)
                    .buttonStyle(CustomButtonStyle(backgroundColor: .disabledButton))
                    
                    if #available(macOS 13.0, *) {
                        NavigationLink(value: dataManager.careers) {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: checkDisabled() ? .disabledButton : .primaryBlue))
                        .disabled(checkDisabled())
                    } else {
                        NavigationLink {
                            WriteCareerView(careerList: $dataManager.careers)
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
    func checkDisabled() -> Bool {
        return dataManager.educationHistory.educationType.isEmpty ||
        dataManager.educationHistory.location.isEmpty ||
        dataManager.educationHistory.name.isEmpty
    }
}
