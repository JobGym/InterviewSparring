//
//  SwiftUIView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/08.
//

import SwiftUI

struct SummaryResultView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        VStack {
            Text("종합 면접 결과")
                .font(.Job.title1)
                .foregroundColor(.primaryBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                VStack(spacing: 8) {
                    
                    SubtitleProgress(title: "음성 평가", score: CGFloat(dataManager.voiceScore))
                    
                    ResultContentView(isVoiceResult: true)
                }
                VStack(spacing: 8) {
                    
                    SubtitleProgress(title: "답변 평가", score: CGFloat(dataManager.answerScore))
                    
                    ResultContentView(isVoiceResult: false)
                }
            }
            
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 40)
        .background(Color.blueBackground)
    }
}

struct SubtitleProgress: View {
    let title: String
    let score: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 8){
            Text(title)
                .font(.Job.title3)
                .foregroundColor(.primaryBlue)
            ProgressBarHorizontal(value: score)
        }
        .frame(height: 30)
    }
}

struct ResultContentView: View {
    @EnvironmentObject var dataManager: DataManager
    let isVoiceResult: Bool
    
    var body: some View {
        ScrollView {
            if isVoiceResult {
                VStack {
                    ForEach(Array(dataManager.summaryVoiceResult.enumerated()), id: \.offset) { index, results in
                        Text(getSummaryTitle(index:index))
                            .font(.Job.body0)
                            .foregroundColor(.primaryBlue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        ForEach(results, id: \.self) {result in
                            Text(result)
                                .font(.Job.footnote2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.leading, 15)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
            }else {
                Text(dataManager.summaryAnswerResult)
                    .font(.Job.footnote2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func getSummaryTitle(index: Int) -> String {
        switch index {
        case 0:
            return "목소리"
        case 1:
            return "발음"
        case 2:
            return "속도"
        default:
            return ""
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryResultView()
    }
}
