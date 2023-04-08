//
//  Array+Extension.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
