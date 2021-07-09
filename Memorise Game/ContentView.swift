//
//  ContentView.swift
//  Memorise Game
//
//  Created by Yury Dzhishkariani on 7/8/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🏎,", "🚕", "🚅", "✈️", "🛩"]
    @State var emojiCount = 2
    
    var body: some View {
        
        VStack{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<emojiCount], id:\.self){ emoji in
                    GameCard(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }//ForEach
                
            
        }//LazyVGrid
        }//ScrollView
                Spacer()
            HStack {
                delete
                Spacer()
                add
                
            }//Hstack(buttons)
            .font(.largeTitle)
            .padding(.horizontal)
        }//Vstack
    
    
    }//View
    
    var add : some View {
        Button(action: {
            if emojiCount < emojis.count {
            emojiCount += 1
            }
        }, label: {
            VStack {
            Image(systemName: "plus.circle")
            }
            
        })
    }
    var delete : some View {
        Button(action: {
            if emojiCount > 1 {
            emojiCount -= 1
            }
        }, label: {
            VStack {
            Image(systemName: "minus.circle")
            }
            
        })
    }
        }//View
    
        
    




struct GameCard: View {
    var content: String
    @State var isFacedUp : Bool = true

    var body: some View {
    let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            if isFacedUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
        }
            else {
                shape.fill()
            }
            }.onTapGesture { isFacedUp = !isFacedUp }
        
    }
}



 























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
