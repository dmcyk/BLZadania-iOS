//
//  main.swift
//  BLZadania
//
//  Created by Damian Malarczyk on 11.12.2015.
//  Copyright © 2015 Damian Malarczyk. All rights reserved.
//

import Foundation




var flash = Flashcard(front: "front", back: "back", tips: [Tip.Image(path: "path"),Tip.Text(text: "some text")],learned:true)
var flash2 = Flashcard(front: "back", back: "front",
        tips: [Tip.Image(path: "path"),Tip.Text(text: "some text")],learned:false)

print("function with list of elemenets\n")
var result = notLearnedYet(flash,flash2)
result.forEach({ print("\($0) \n")})

print("random flashcards \n")
var flashRandom = generateFlashcards(5)
flashRandom[1].tips.append(Tip.Text(text: "text tip test"))
flashRandom.forEach({ print("\($0) \n")})

print("not learned extension \n")
var notLearned = flashRandom.getNotLearnedYet()
notLearned.forEach({print("\($0) \n")})


print("debug print : ")
if notLearned.count > 0 && notLearned[0].tips.count > 0 {
    debugPrint(notLearned[0].tips[0])
}
