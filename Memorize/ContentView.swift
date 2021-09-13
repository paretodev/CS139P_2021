//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Han on 2021/06/20.
// View : draw what's in the model, trace-draw it

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    var body: some View {
        ScrollView{
            LazyVGrid( columns: [ GridItem( .adaptive(minimum: 65.0) ) ] ) {
                ForEach( viewModel.model.cards ) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode : .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
        }
    }
}

struct CardView : View {
    let card : MemoryGame<String>.Card
    
    var body : some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0).foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else{
                shape.fill().foregroundColor(.red)
            }
        }
    }
}

//MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .previewDevice("iPhone SE (2nd generation)")
            .preferredColorScheme(.dark)
            .padding(.horizontal)
        
        ContentView(viewModel: game)
            .previewDevice("iPhone SE (2nd generation)")
            .preferredColorScheme(.light)
            .padding(.horizontal)
    }
}
