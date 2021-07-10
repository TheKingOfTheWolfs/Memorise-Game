//
//  GameModel.swift
//  Memorise Game
//
//  Created by Yury Dzhishkariani on 7/9/21.
//

import Foundation

struct GameModel<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose (_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].IsFaceUp.toggle()
        
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
          return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(context: content))
            cards.append(Card(context: content))
        }
    }
    
    
    
    
    
    
    
    
    struct Card {
        var IsFaceUp: Bool = false
        var isMatched: Bool = false
        var context: CardContent
//        var id: Identifiable
        
    }
    
    
}//GameModel

