//
//  ColorExtension.swift
//  InterviewSparring
//
//  Created by 김은교 on 2023/04/02.
//

import SwiftUI
 
extension Color {
 
    static let primaryBlue = Color("primaryBlue")
    static let blueBackground = Color("backgroundColor")
    static let lightGray = Color("lightGray")
    
    //static let pdfComponentBlue = Color("pdfComponentBlue")
    //static let pdfComponentRed = Color("pdfComponentRed")
    //static let pdfStrokeRed = Color("pdfStrokeRed")
    
    //static let Background_black = Color(hex: "#f1f6ff")
}

/*
 //color code to rgb
 
 extension Color {
 init(hex: String) {
 let scanner = Scanner(string: hex)
 _ = scanner.scanString("#")
 
 var rgb: UInt64 = 0
 scanner.scanHexInt64(&rgb)
 
 let r = Double((rgb >> 16) & 0xFF) / 255.0
 let g = Double((rgb >>  8) & 0xFF) / 255.0
 let b = Double((rgb >>  0) & 0xFF) / 255.0
 self.init(red: r, green: g, blue: b)
 }
 }
 */
