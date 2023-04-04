//
//  DropdownMenu.swift
//  InterviewSparring
//
//  Created by 전지민 on 2023/04/04.
//
import SwiftUI

struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
    
    var key: String
    var val: String
    
}

extension DropdownOption {
    func fetchAcademicCategory() -> [DropdownOption] {
        return [
            DropdownOption(key: "highschool", val: "고등학교"),
            DropdownOption(key: "college", val: "전문대학"),
            DropdownOption(key: "university", val: "대학교"),
            DropdownOption(key: "master", val: "대학원(석사)"),
            DropdownOption(key: "Doctor", val: "대학원(박사)"),
        ]
    }
    func fetchLocation() -> [DropdownOption] {
        return [
            DropdownOption(key: "Seoul", val: "서울"),
            DropdownOption(key: "Gyeonggi", val: "경기"),
            DropdownOption(key: "Incheon", val: "인천"),
            DropdownOption(key: "Gangwon", val: "강원"),
            DropdownOption(key: "Chungbuk", val: "충북"),
            DropdownOption(key: "Chungnam", val: "충남"),
            DropdownOption(key: "Daejeon", val: "대전"),
            DropdownOption(key: "Sejong", val: "세종"),
            DropdownOption(key: "busan", val: "부산"),
            DropdownOption(key: "Ulsan", val: "울산"),
            DropdownOption(key: "Daegu", val: "대구"),
            DropdownOption(key: "Gyeongbuk", val: "경북"),
            DropdownOption(key: "Gyeongnam", val: "경남"),
            DropdownOption(key: "Jeonbuk", val: "전북"),
            DropdownOption(key: "Jeonnam", val: "전남"),
            DropdownOption(key: "Gwangju", val: "광주"),
            DropdownOption(key: "Jeju", val: "제주"),
            DropdownOption(key: "Overseas", val: "해외")
        ]
    }
}


struct DropdownOptionElement: View {
    var val: String
    var key: String
    @Binding var isShowDropdown: Bool
    var onSelect: ((_ val: String) -> Void)?
    
    var body: some View {
        Button {
            if let onSelect = self.onSelect {
                onSelect(self.val)
            }
            isShowDropdown.toggle()
        } label: {
            Text(self.val)
                .font(Font.Job.headline2)
                .foregroundColor(.black)
        }
        .buttonStyle(.borderless)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)

    }
}

struct DropdownMenu: View {
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?
    @Binding var isShowDropdown: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id:\.self) {option in
                DropdownOptionElement(val: option.val, key: option.key, isShowDropdown: $isShowDropdown, onSelect: self.onSelect)
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 1)
        )
    }
}

struct DropdownButton: View {
    @State var isShowDropdown = false
    @Binding var displayText: String
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?
    
    let buttonHeight: CGFloat = 48
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isShowDropdown.toggle()
            }
        }) {
            HStack {
                Text(displayText == "" ? "OOO" : displayText)
                    .font(Font.Job.headline2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                Image(self.isShowDropdown ? "dropdown.up" : "dropdown")
            }
        }
        .buttonStyle(.borderless)
        .padding(.horizontal)
        .cornerRadius(84)
        .frame(height: self.buttonHeight)
        .frame(width: 175)
        .overlay(
            VStack {
                if self.isShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    DropdownMenu(options: self.options, onSelect: self.onSelect, isShowDropdown: $isShowDropdown)
                }
            }, alignment: .top
        )
        .background(
            RoundedRectangle(cornerRadius: 84).fill(Color.white)
        )
    }
}
