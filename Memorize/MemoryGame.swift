//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Salvador Colomina Domenech on 6/3/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards : Array<Card>
    
    func choose(_ card : Card) {
        
    }
    
    struct Card {
        var isFacedUp : Bool
        var isMatched : Bool
        var content : CardContent
    }
}
