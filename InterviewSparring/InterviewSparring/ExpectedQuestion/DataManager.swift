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
    
    @Published var interviewQuestion = [String](repeating: "", count: 4)
    @Published var interviewAnswer = [String](repeating: "", count: 4)
    @Published var interviewFeedback = [String](repeating: "", count: 4)
    
    
    #if DEBUG
    init() {
        interviewQuestion = [
            "1. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "2. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "3. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "4. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요."
        ]
        interviewQuestion = [
            "1. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "2. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "3. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
            "4. iOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.\niOS 앱의 생명주기(Lifecycle)에 대해 설명해주세요.\n어떤 상태가 있고, 각 상태에서 어떤 메소드가 호출되는지 예를 들어주세요.",
        ]
        interviewAnswer = [
            "1 답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다.. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로어쩌고..",
            "2 답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다.. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로어쩌고..",
            "3 답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다.. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로어쩌고..",
            "4 답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다.. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로답변의 전체적인 구조와 내용은 좋습니다. 앱의 생명주기와 Scene의 상태를 잘 설명하셨습니다. \n답변의 시작 부분에서 iOS 13부터 Scene이 도입되었다고 언급하셨는데, 이전 버전에서는 앱의 생명주기가 어떻게 다른지도 추가하면 좋을 것 같습니다. 예를 들어, iOS 12 이하에서는 앱 전체가 하나의 Scene으로 취급되고, 앱 델리게이트에서 생명주기 이벤트를 처리한다고 말할 수 있습니다.\n\n답변의 마지막 부분에서 Suspended 상태에 대해 설명하실 때, 시스템이 임의로 Background 상태의 앱을 Suspended로어쩌고.."
        ]
    }
    #endif
}
