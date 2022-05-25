//
//  PointsView.swift
//  Bullseye
//
//  Created by Caroline Chan on 23/05/22.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var isAlertVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                withAnimation{
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
            }){
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10.0, x: 5.0, y: 5.0)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var isAlertVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(sliderValue: sliderValue, game: game, isAlertVisible: isAlertVisible)
        PointsView(sliderValue: sliderValue, game: game, isAlertVisible: isAlertVisible)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(sliderValue: sliderValue, game: game, isAlertVisible: isAlertVisible)
            .preferredColorScheme(.dark)
        PointsView(sliderValue: sliderValue, game: game, isAlertVisible: isAlertVisible)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
