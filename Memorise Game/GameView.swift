//
//  GameView.swift
//  Memorise Game
//
//  Created by Yury Dzhishkariani on 7/9/21.
//

import SwiftUI


class GameView {
    static let emojis = ["🚗", "🏎", "🚕", "🚅", "✈️", "🛩", "🚀", "🛰", "🛥", "🛳", "🚢", "🛺", "🏍", "🚋", "⛵️", "🚁"]
    

    static func createGameModel() -> GameModel<String> {
        GameModel<String>(numberOfPairsOfCards: 5) { pairIndex in emojis[pairIndex] }
    }
    
    
    
    
    
    private var model: GameModel<String> = createGameModel()
    
    var cards: Array<GameModel<String>.Card> {
        model.cards
    }
    
    
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: GameModel<String>.Card) {
        model.choose(card)
    }
    
    
}//GameView
