//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Han on 2021/06/20.
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid( columns: [ GridItem( .adaptive(minimum: 70.0) ) ] ) {
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
        //Keep this UI-declaritive code to be as "clean" as possible.
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: CardDrawConstants.cornerRadius)
                
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: CardDrawConstants.lineWidth).foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                    Text(card.content).font(customFont(in: geometry.size)) // 1 liner clean code !
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else{
                    shape.fill().foregroundColor(.red)
                }
            }
        }
    }

    //CardView : funcs and consts
    private func customFont(in size: CGSize) -> Font {
        Font.system(size: min( size.width ,size.height) * CardDrawConstants.fontScale
        )
    }
    
    private struct CardDrawConstants {
        static let cornerRadius: CGFloat = 20.0
        static let lineWidth: CGFloat  = 3.0
        static let fontScale: CGFloat  = 0.8
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
