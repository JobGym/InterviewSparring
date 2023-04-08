//
//  WriteCareerView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct WriteCareerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var dataManager: DataManager
    @Binding var careerList: [[Career]]
    
    @State var isShowAddView = false
    @State var progressValue: CGFloat = 50.0
    
    
    var body: some View {
        
        ZStack(alignment: .trailing){
            ProgressView(value: 99)
            
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("이력서 제출")
                        .font(Font.Job.title1)
                    Text("경력사항")
                        .font(Font.Job.headline1)
                }
                .foregroundColor(.primaryBlue)
                .padding(.top, 63)
                
                VStack(spacing: 5) {
                    HStack{
                        Spacer()
                        
                        Button {
                            isShowAddView.toggle()
                        } label: {
                            Image("plus")
                                .frame(width: 30, height: 30)
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 40)
                    
                    HStack(spacing: 15) {
                        Text("고용형태")
                            .frame(width: 100, alignment: .center)
                        Text("회사명")
                            .frame(width: 100, alignment: .center)
                        Text("부서명")
                            .frame(width: 100, alignment: .center)
                        Text("근무 기간(개월)")
                            .frame(width: 100, alignment: .center)
                        Text("퇴사 유무")
                            .frame(width: 100, alignment: .center)
                        Text("직책")
                            .frame(width: 100, alignment: .center)
                        Text("업무내용")
                            .frame(width: 100, alignment: .center)
                    }
                    .font(.Job.headline1)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 40)
                    .padding(.trailing, 40)
                    .padding(.vertical, 16)
                    
                    List {
                        ForEach(careerList, id: \.self) { career in
                            
                            ForEach(career) { content in
                                VStack {
                                    HStack(spacing: 15) {
                                        Text(content.employmentForm)
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text(content.firm)
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text(content.department)
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text("\(content.period)개월")
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text(content.isResignate ? "유" : "무")
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text(content.position)
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Text(content.details)
                                            .frame(width: 100, alignment: .center)
                                            .lineLimit(1)
                                        Button {
                                            careerList[0].removeAll { $0.id == content.id }
                                        } label: {
                                            Image("trash")
                                                .frame(width: 24, height: 24)
                                        }
                                        .buttonStyle(.borderless)
                                        .padding(.leading, 10)
                                        
                                    }
                                    .font(.Job.body1)
                                }
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 5))
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal, 40)
                }
                .background(Color.white)
                .cornerRadius(22)
                
                
                HStack(spacing: 16) {
                    Spacer()
                    Button {
                        print("이전")
                        dismiss()
                    } label: {
                        Text("이전")
                    }
                    
                    if #available(iOS 16.0, *) {
                        NavigationLink(value: dataManager.qualification) {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    } else {
                        NavigationLink {
                            WriteQualificationView(qualification: $dataManager.qualification)
                        } label: {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                    }
                    
                    Spacer()
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: .blue))
                .padding(.bottom, 64)
                
            }
            .padding(.horizontal, 40)

        }
        .background(Color.blueBackground)
        .navigationBarHidden(true)
        .sheet(isPresented: $isShowAddView) {
            AddCareerView(isShowAddView: $isShowAddView, careerList: $careerList)
        }
    }
}

struct ProgressBar: View {
    var value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 10 , height: geometry.size.height)
                    .foregroundColor(.progressGray)
                Rectangle()
                    .frame(width: 10 , height: value)
                    .foregroundColor(.primaryBlue)
                
            }
        }
    }
}

struct ProgressView:View {
    var value: CGFloat
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack {
                Spacer()
                Text("이력서제출")
                    .padding(.bottom, 305)
                Text("자소서제출")
                Spacer()
            }
            .foregroundColor(.textDarkGray)
            .font(Font.Job.caption)
            .frame(width: 10)
            .fixedSize(horizontal: true, vertical: false)
            ProgressBar(value: value)
                .frame(width: 10)
        }
    }
}

struct WriteCareerView_Previews: PreviewProvider {
    static var previews: some View {
        WriteCareerView(careerList: .constant([[Career]]()))
    }
}
