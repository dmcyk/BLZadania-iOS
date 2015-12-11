//
//  Utils.swift
//  BLZadania
//
//  Created by Damian Malarczyk on 11.12.2015.
//  Copyright © 2015 Damian Malarczyk. All rights reserved.
//

import Foundation


func notLearnedYet(elements:CanBeTaught...) -> [CanBeTaught]{
   return elements.filter({ $0.learned == false})
}


extension SequenceType where Generator.Element:CanBeTaught {
    func getNotLearnedYet()->[Generator.Element]{
        return self.filter({ $0.learned == false})
    }
}

func generateFlashcards(x:Int)->[Flashcard] {
    var result = [Flashcard]()
    for index in 1...x {
        let front = arc4random_uniform(UInt32(RAND_MAX)) / UInt32(index)
        let back = arc4random_uniform(UInt32(RAND_MAX)) / UInt32(index)
        let tip = arc4random_uniform(2)
        result.append(Flashcard(front: String(front),
            back: String(back),
            tips: tip == 1 ? [Tip.Text(text: "text tip")] : [Tip.Image(path: "image path tip")],
            learned: tip == 1 ? false : true))
    }
     return result
}