//
//  LoadingView.swift
//  InterviewSparring
//
//  Created by Kyubo Shim on 2023/04/08.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke( // 1
                    Color.primaryBlue.opacity(0.5),
                    lineWidth: 30
                )
            
            Circle() // 2
                .trim(from: 0, to: 0.2)
                .stroke(Color.primaryBlue, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                                    self.isLoading = true
                            }
            
        }
        .frame(width: 250, height: 250)
    }

}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
