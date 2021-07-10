//
//  ContentView.swift
//  Memorise Game
//
//  Created by Yury Dzhishkariani on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    let viewModel: GameView
    
    var body: some View {
        
        VStack{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards){ card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }//ForEach
                
            
        }//LazyVGrid
        }//ScrollView
            .font(.largeTitle)
            .padding(.horizontal)
        }//Vstack
    
    
    }//View
    
        }//View
    
        
    




struct CardView: View {
    let card: GameModel<String>.Card
    

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
        }
            else {
                shape.fill()
            }
            }
        
    }
}



 























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameView()
        ContentView(viewModel: game).preferredColorScheme(.light)
        ContentView(viewModel: game).preferredColorScheme(.dark)
    }
}
