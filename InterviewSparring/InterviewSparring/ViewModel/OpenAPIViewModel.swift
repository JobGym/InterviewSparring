//
//  OpenAPIViewModel.swift
//  OpenAIAPITest
//
//  Created by Kyubo Shim on 2023/04/08.
//

import Foundation
import OpenAISwift
import SwiftUI

struct APIKey: Codable {
    let apiKey: String
}

class LoadingState: ObservableObject {
    @Published var isLoading: Bool = false

    func startLoading() {
        isLoading = true
    }

    func stopLoading() {
        isLoading = false
    }
}

final class OpenAPIViewModel: ObservableObject {
    @EnvironmentObject var dataManager: DataManager
    var loadingState = LoadingState()
    @Published var isLoading: Bool = false
    @Published var isFeedbackLoading: Bool = false
    @Published var resultTexts: [String] = []
    @Published var questionText: String = ""
    
    init() {
        setupAPI()
    }
    
    private var apiClient: OpenAISwift?
    
    private func setupAPI() {
        guard
            let propertiesData = loadJson(filename: "properties"),
            let clientData = try? JSONDecoder().decode(APIKey.self, from: propertiesData)
        else {
            return
        }
        
        let openAIkey = clientData.apiKey
        apiClient = OpenAISwift(authToken: openAIkey)
    }
    
    func submitQuestion() {
        questionText.append("\n\n이 이력서 내용을 바탕으로 면접 질문만 4개를 각 질문별로 세미콜론으로 구분해서 보여줘.")
        
        guard !questionText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        isLoading = true
        
        fetchAnswer(text: questionText) { responseTexts in
            DispatchQueue.main.async {
                self.resultTexts = responseTexts
                self.questionText = ""
                self.isLoading = false
            }
        }
    }
    
    func submitAnswer() {
        questionText.append("\n\n위 면접 답변은 총 10점 만점에 몇점이고 그에 대한 피드백을 제시해줘")
        
        guard !questionText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        loadingState.startLoading()
        
        fetchAnswer(text: questionText) { responseTexts in
            DispatchQueue.main.async {
                self.resultTexts = responseTexts
                self.questionText = ""
                self.loadingState.stopLoading()
            }
        }
    }
    
    func summarizeAnswer() {
        questionText.append("\n\n위 문장들을 250자로 요약한 결과물을 대괄호 안에 넣어줘")
        guard !questionText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        isLoading = true
        
        fetchAnswer(text: questionText) { responseTexts in
            DispatchQueue.main.async {
                self.resultTexts = responseTexts
                self.questionText = ""
                self.isLoading = false
            }
        }
    }
    
    func fetchAnswer(text: String, completion: @escaping ([String]) -> Void) {
        apiClient?.sendCompletion(with: text, model: .gpt3(.davinci), maxTokens: 1000, temperature: 0.5, completionHandler: { result in
            switch result {
                case .success(let model):
                    let output = model.choices?.first?.text ?? ""
                    let substrings = output.split(separator: ";").map { String($0).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "\n", with: "") }
                    var resultTexts: [String] = [output] // Add the original answer
                    resultTexts.append(contentsOf: substrings)
                    completion(resultTexts)
                case .failure(let failure):
                    print(failure.localizedDescription)
            }
        })
    }

    
    func loadJson(filename: String) -> Data? {
        let extensionType = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: filename, withExtension: extensionType)
        else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        }
        catch {
            return nil
        }
    }
}
