//
//  DataManager.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import Foundation
import SwiftUI

class DataManager: ObservableObject {
    @Published var educationHistory = EducationHistory(educationType: "", location: "", name: "", major: "", minor: "", enterDate: Date(), graduateDate: Date())
    @Published var careers = [[Career]](repeating: [Career](), count: 1)
    @Published var qualification = Qualification(name: "", grade: "", getDate: Date(), authority: "")
    @Published var language = Language(language: "", name: "", grade: "", score: "", getDate: Date(), authority: "")
    
    @Published var jobSelection = JobQuestion.none
    @Published var jobQuestion = [String]()
    @Published var jobAnswer = [String](repeating: "", count: 4)
    
    var summaryVoiceResult = [[String]](repeating: [String](), count: 3)
    var summaryAnswerResult = ""
    
    var voiceScore = 30
    var answerScore = 87
    
    #if DEBUG
    init() {
        summaryVoiceResult = [
            [
                "목소리는 크기가 적당해서 명료하게 들립니다. 면접 상황에서 매우 중요한 점이에요.",
                "하지만 가끔 목소리가 작아지는 부분이 있어서, 의사소통이 어려울 수 있어요. 더 크고 자신감있게 말해보세요."
            ],
            [
                "발음은 명료하고 정확합니다. 상대방에게 잘 전달될 수 있도록 발음에 신경 쓰셨군요.",
                "하지만 발음이 조금 단조롭게 들릴 때가 있어요. 다양한 억양과 감정을 담아 말하면 더 좋을 것 같아요."
            ],
            [
                "속도는 적절하고 일정하게 유지되어서 이해하기 쉬웠습니다.",
                "하지만 중간에 말이 끊기거나 느리게 말하는 부분이 있어서 이해하기 어려운 부분이 있었습니다. 더 자연스럽고 일정한 속도로 말하도록 노력해보세요."
            ],
        ]
        
        summaryAnswerResult = "이 질문에 대한 나의 답변은 스크럼 방법론을 사용한다는 것입니다. 이 방법론은 큰 틀을 스크럼으로 나누고, 스크럼을 더 작은 스프린트 단위로 나누는 것을 중심으로 합니다. 목표를 명확하게 설정하고 백로그를 작성한 후, 1~4주 정도의 주기로 스프린트를 설정하여 사용자의 피드백을 빠르게 수집하고 문제점을 수정해 나갑니다. 이러한 방법을 통해 제품의 문제점을 파악하고 개선하는 데 효과적인 결과를 얻을 수 있습니다. \n이 답변에서 잘한 점은 스크럼 방법론을 사용한다는 것을 명확하게 밝혔다는 것입니다. 또한, 목표를 설정하고 백로그를 작성한 후 스프린트를 설정하여 사용자의 피드백을 반영하는 과정을 구체적으로 설명했습니다."
    }
    #endif
}
