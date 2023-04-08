//
//  SpeechToTextViewModel.swift
//  OpenAIAPITest
//
//  Created by Kyubo Shim on 2023/04/08.
//

import Foundation
import Speech
import AVFoundation

class SpeechToTextViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var isRecording: Bool = false
    
    private var audioEngine = AVAudioEngine()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func stopRecording() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        recognitionRequest = nil
        recognitionTask = nil
    }
    
    func startRecording() {
        let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
        
        recognitionTask?.cancel()
        self.recognitionTask = nil
        
        guard speechRecognizer.isAvailable else {
            print("Speech Recognition is not available")
            return
        }
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            let inputNode = audioEngine.inputNode
            
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = recognitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest 객체 생성 오류") }
            recognitionRequest.shouldReportPartialResults = true
            
            if #available(iOS 13, *) {
                recognitionRequest.requiresOnDeviceRecognition = false
            }
            
            recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
                var isFinal = false
                
                if let result = result {
                    self.text = result.bestTranscription.formattedString
                    isFinal = result.isFinal
                    print("Text \(result.bestTranscription.formattedString)")
                }
                
                if error != nil || isFinal {
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    self.recognitionRequest = nil
                    self.recognitionTask = nil
                }
            }
            
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
                self.recognitionRequest?.append(buffer)
            }
            
            audioEngine.prepare()
            try audioEngine.start()
            
            self.text = ""
        } catch {
            print("Error starting recording: \(error.localizedDescription)")
        }
    }
    
    func toggleRecording(selectedLang: String) {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
        
        isRecording.toggle()
    }
}
