//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Salvador Colomina Domenech on 4/3/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
