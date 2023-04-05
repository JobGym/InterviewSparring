//
//  WriteCareerView.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/05.
//

import SwiftUI

struct WriteCareerView: View {
    @State var careerList: [[Career]] = [
        Career(employmentForm: EmploymentForm.contract.rawValue, firm: "삼성전자", department: "SW개발팀", period: "6", isResignate: false, position: "SW엔지니어", details: "회사 사이트 웹프로젝트 어쩌고"),
        Career(employmentForm: EmploymentForm.part.rawValue, firm: "삼성전자", department: "SW개발팀", period: "6", isResignate: false, position: "SW엔지니어", details: "가나다라마바사아자차카타파하가나다라마바사아자차카타파하")
    ].chunked(into: 7)
    
    @State var isShowAddView = false
    @State var progressValue: CGFloat = 50.0
    
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Spacer()
                VStack {
                    Spacer()
                    Text("이력서제출")
                    Spacer()
                    Text("자소서제출")
                    Spacer()
                }
                .foregroundColor(.textDarkGray)
                .font(Font.Job.caption)
                .frame(width: 10)
                .fixedSize(horizontal: true, vertical: false)
                ProgressBar(value: $progressValue)
                    .frame(width: 10)
            }
            
            GeometryReader { geo in
                let spacing: CGFloat = 10
                let width = geo.size.width - 320
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("이력서 제출")
                            .font(Font.Job.title1)
                        Text("경력사항")
                            .font(Font.Job.headline1)
                    }
                    .foregroundColor(.primaryBlue)
                    .padding(.top, 63)
                    
                    
                    List {
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
                        
                        HStack(spacing: spacing) {
                            Text("고용형태")
                                .frame(width: width/12, alignment: .center)
                            Text("회사명")
                                .frame(width: width/7.5, alignment: .center)
                            Text("부서명")
                                .frame(width: width/7.5, alignment: .center)
                            Text("근무 기간(개월)")
                                .frame(width: width/6, alignment: .center)
                            Text("퇴사 유무")
                                .frame(width: width/10, alignment: .center)
                            Text("직책")
                                .frame(width: width/7.5, alignment: .center)
                            Text("업무내용")
                                .frame(width: width/6.5, alignment: .center)
                        }
                        .font(.Job.headline1)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 80)
                        .padding(.vertical, 16)
                        
                        
                        ForEach(careerList, id: \.self) { career in
                            
                            ForEach(career) { content in
                                VStack {
                                    HStack(spacing: spacing) {
                                        Text(content.employmentForm)
                                            .frame(width: width/12, alignment: .center)
                                        Text(content.firm)
                                            .frame(width: width/7.5, alignment: .center)
                                        Text(content.department)
                                            .frame(width: width/7.5, alignment: .center)
                                        Text("\(content.period)개월")
                                            .frame(width: width/6, alignment: .center)
                                        Text(content.isResignate ? "유" : "무")
                                            .frame(width: width/10, alignment: .center)
                                        Text(content.position)
                                            .frame(width: width/7.5, alignment: .center)
                                        Text(content.details)
                                            .frame(width: width/6.5, alignment: .center)
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
                                    
                                    Divider()
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 80)
                    }
                    .cornerRadius(22)
                    
                    
                    HStack(spacing: 16) {
                        Spacer()
                        Button {
                            print("이전")
                        } label: {
                            Text("이전")
                        }
                        
                        NavigationLink {
                            WriteQualificationView()
                        } label: {
                            Text("다음")
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .primaryBlue))
                        Spacer()
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .blue))
                    .padding(.bottom, 64)
                    
                }
                .padding(.horizontal, 80)
            }
        }
        .sheet(isPresented: $isShowAddView) {
            AddCareerView(isShowAddView: $isShowAddView, careerList: $careerList)
        }
    }
}

struct ProgressBar: View {
    @Binding var value: CGFloat
    
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

struct Career: Hashable, Identifiable {
    let id = UUID()
    var employmentForm: String
    var firm: String
    var department: String
    var period: String
    var isResignate: Bool
    var position: String
    var details: String
}

enum EmploymentForm: String {
    case permanent = "정규직"
    case contract = "계약직"
    case intern = "인턴"
    case dispatched = "파견직"
    case freelance = "프리랜서"
    case part = "아르바이트"
}



struct WriteCareerView_Previews: PreviewProvider {
    static var previews: some View {
        WriteCareerView()
    }
}
