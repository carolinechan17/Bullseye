//
//  TextViews.swift
//  Bullseye
//
//  Created by Caroline Chan on 20/05/22.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .bold()
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .foregroundColor(Color.white)
            .font(.body)
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var score: Int
    var body: some View{
        Text(String(score))
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date
    var body: some View{
        Text(date, style: .time)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction")
            BigNumberText(text: "99")
            LabelText(text: "Score")
            BodyText(text: "You scored 149 points")
            ButtonText(text: "Start New Round")
            ScoreText(score: 467)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }.padding()
    }
}
