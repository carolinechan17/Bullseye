//
//  ContentView.swift
//  Bullseye Game
//
//  Created by Caroline Chan on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible = false;
    @State private var sliderValue = 50.0;
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.leading, 60.0)
                    .padding(.trailing, 60.0)
                    .padding(.bottom, isAlertVisible ? 0 : 100)
                if isAlertVisible {
                    PointsView(sliderValue: $sliderValue, game: $game, isAlertVisible: $isAlertVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(sliderValue: $sliderValue, game: $game, isAlertVisible: $isAlertVisible)
                        .transition(.scale)
                }
            }
            if !isAlertVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            InstructionText(text: "Put the bullseye as close as you can to the target")
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in:1.00 ... 100.00 )
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct HitMeButton: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var isAlertVisible: Bool
    var body: some View {
        Button(
            action: {
                withAnimation{
                    isAlertVisible = true
                }
            }
        ){
            Text("Hit me".uppercased())
                .bold()
        }
        .padding(20.0)
        .background(
            ZStack{
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
