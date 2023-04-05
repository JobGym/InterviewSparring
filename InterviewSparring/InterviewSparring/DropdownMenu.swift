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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id:\.self) {option in
                    DropdownOptionElement(val: option.val, key: option.key, isShowDropdown: $isShowDropdown, onSelect: self.onSelect)
                }
            }
        }
        .frame(height: 175)
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
