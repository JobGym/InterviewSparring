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

final class OpenAPIViewModel: ObservableObject {
    @EnvironmentObject var dataManager: DataManager
    @Published var isLoading: Bool = false
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
        questionText.append("\n\n이 이력서 내용을 바탕으로 '요'자로 끝나는 면접 질문 4개를 각각 세미콜론로 구분해서 대괄호 안에 넣어줘.")
        
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
        apiClient?.sendCompletion(with: text, model: .gpt3(.davinci), maxTokens: 1000, temperature: 1, completionHandler: { result in
            switch result {
                case .success(let model):
                    let output = model.choices?.first?.text ?? ""
                    let pattern = "\\[(.*?)\\]"
                    let regex = try? NSRegularExpression(pattern: pattern, options: [])
                    let nsRange = NSRange(output.startIndex..<output.endIndex, in: output)
                    var resultTexts: [String] = [output] // Add the original answer
                    
                    regex?.enumerateMatches(in: output, options: [], range: nsRange) { (match, _, _) in
                        if let matchRange = match?.range(at: 1),
                           let range = Range(matchRange, in: output) {
                            let substrings = output[range].split(separator: ";").map { String($0).trimmingCharacters(in: .whitespaces) }
                            resultTexts.append(contentsOf: substrings)
                        }
                    }
                    
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
