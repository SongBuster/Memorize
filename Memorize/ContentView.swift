//
//  ContentView.swift
//  Memorize
//
//  Created by Salvador Colomina Domenech on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    let vehicles = (Color.gray,["🚗","🚌","🚜","🛵","✈️","🚊","🚁","⛵️","🚲","🛴"])
    let nature = (Color.green,["🎄","🍁","🐳","🌸","🌊","☘️","🪵","🌈"])
    let flags = (Color.red,["🇦🇹","🇧🇷","🇨🇦","🇨🇳","🇰🇷","🇪🇸","🇮🇳","🇮🇹","🇯🇵","🇳🇴","🇵🇪"])
    
    @State var emojis : Array<String> = []
    @State var color : Color = Color.red
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
            ScrollView {
                cards
            }
            Spacer()
            themeButtons
        }
        .padding()
    }
        
    var themeButtons : some View {
        HStack(alignment: .lastTextBaseline) {
            createThemeButton(of: vehicles, withLabel: "Vehicles", andIcon: "car")
            createThemeButton(of: nature, withLabel: "Nature", andIcon: "tree")
            createThemeButton(of: flags, withLabel: "Flags", andIcon: "flag")
        }
    }
    
    func createThemeButton(of collection: (Color, Array<String>), withLabel label: String, andIcon image: String) -> some View{
            Button(action: {
                let numberOfCards = collection.1.count
                let numberOfPairs = Int.random(in: 2...numberOfCards)
                print(numberOfPairs)
                let randomCollection = collection.1[0...numberOfPairs-1]
                let newCollection = randomCollection + randomCollection
                emojis = newCollection.shuffled()
                color = collection.0
            }, label: {
                VStack {
                    Image(systemName: image)
                        .imageScale(.large)
                    Text(label)
                        .font(.footnote)
                }.padding()
            })
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60.0))]) {
            ForEach(0..<emojis.count, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(color)
    }
}

struct CardView: View {
    let content : String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
             
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
         }
    }
}

#Preview {
    ContentView()
}
 
