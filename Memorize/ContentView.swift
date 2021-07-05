//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Han on 2021/06/20.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🍎","🍊","🥝", "🍇", "🍿", "💻", "🎸", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    @State var emojiCount = 15
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid( columns: [ GridItem( .adaptive(minimum: 65.0) ) ] ) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode : .fit)
                    }
                }
                .foregroundColor(.red)
            }
        }
        .padding(.all)
    }
    
}

//MARK- Types
struct CardView : View {
    var content : String
    @State var isFaceUp : Bool = true
    
    //lazy access if i use lazy vertical grid
    var body : some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0).foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
        
    }
}



//MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
            .preferredColorScheme(.dark)
            .padding(.horizontal)
        
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
            .preferredColorScheme(.light)
            .padding(.horizontal)
    }
}
