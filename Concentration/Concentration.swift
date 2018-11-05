//
//  Concentration.swift
//  Concentration
//
//  Created by Fan Rong on 10/30/18.
//  Copyright © 2018 Fan Rong. All rights reserved.
//

import Foundation

class Concentration {
	
	var cards = [Card]()
	
	var indexOfOneAndOnlyFacedUpCard: Int?
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFacedUpCard = nil
			} else {
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFacedUpCard = index
			}
		}
	} 
	
	init(numberOfPairsOfCards: Int) {
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		// TODO: Shuffle the cards
	}
}
