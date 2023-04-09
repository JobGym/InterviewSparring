//
//  StartView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ZStack {
                Color.blueBackground.ignoresSafeArea()
                
                NavigationStack {
                    VStack(spacing: 0) {
                        LinearGradient(colors: [.mainGradientBottom, .mainGradientTop], startPoint: .bottom, endPoint: .top)
                            .mask {
                                Text("취도우복싱")
                                    .font(Font.Job.largeTitle)
                            }
                            .frame(height: 70)
                        Text("AI가 추천해주는 예상 질문을 통해 면접을 미리 연습해 보세요!")
                            .font(Font.Job.headline1)
                            .foregroundColor(.primaryBlue)
                        
                        NavigationLink(value: dataManager.educationHistory) {
                            Text("면접 시작하기")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                        .padding(.top, 56)
                    }
                    .navigationDestination(for: EducationHistory.self) { _ in
                        WriteEducationView(educationHistory: $dataManager.educationHistory)
                    }
                    .navigationDestination(for: [[Career]].self) { _ in
                        WriteCareerView(careerList: $dataManager.careers)
                    }
                    .navigationDestination(for: Qualification.self) { _ in
                        WriteQualificationView(qualification: $dataManager.qualification)
                    }
                    .navigationDestination(for: Language.self) { _ in
                        WriteLanguageView(language: $dataManager.language)
                    }
                    .navigationDestination(for: JobQuestion.self) { _ in
                        CoverletterView()
                    }
                    .navigationDestination(for: [String].self) { _ in
                        CoverletterList()
                    }
                }
                .background(Color.blueBackground)
            }
        } else {
            // Fallback on earlier versions
            NavigationView {
                VStack {
                    LinearGradient(colors: [.mainGradientBottom, .mainGradientTop], startPoint: .bottom, endPoint: .top)
                        .mask {
                            Text("취도우복싱")
                                .font(Font.Job.largeTitle)
                        }
                        .frame(height: 70)
                    Text("AI가 추천해주는 예상 질문을 통해 면접을 미리 연습해 보세요!")
                        .font(Font.Job.headline1)
                        .foregroundColor(.primaryBlue)
                    
                    NavigationLink {
                        WriteEducationView(educationHistory: $dataManager.educationHistory)
                    } label: {
                        Text("면접 시작하기")
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    .padding(.top, 56)
                }
            }
            .background(Color.blueBackground)
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
