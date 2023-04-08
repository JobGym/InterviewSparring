//
//  Font+Extension.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

extension Font {
    enum Job {
        static var largeTitle: Font { Font.system(size: 48, weight: .black) }
        static var title1: Font { Font.system(size: 32, weight: .black) }
        static var title2: Font { Font.system(size: 24, weight: .bold) }
        static var title3: Font { Font.system(size: 20, weight: .bold) }
        static var headline1: Font { Font.system(size: 20, weight: .medium) }
        static var headline2: Font { Font.system(size: 20, weight: .regular) }
        static var body0: Font { Font.system(size: 17, weight: .bold) }
        static var body1: Font { Font.system(size: 17, weight: .medium) }
        static var body2: Font { Font.system(size: 17, weight: .regular) }
        static var footnote1: Font { Font.system(size: 15, weight: .medium) }
        static var footnote2: Font { Font.system(size: 15, weight: .regular) }
        static var caption: Font { Font.system(size: 12, weight: .light) }
    }
}

