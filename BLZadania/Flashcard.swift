//
//  Flashcard.swift
//  BLZadania
//
//  Created by Damian Malarczyk on 11.12.2015.
//  Copyright © 2015 Damian Malarczyk. All rights reserved.
//

import Foundation

protocol CanBeTaught {
    var learned:Bool! {get set }
}

class Flashcard : CustomStringConvertible, CanBeTaught {
    var front:String!
    var back:String!
    var learned:Bool!
    var tips:[Tip] = [Tip]()
    
    var description:String {
        get {
            return self.getDescription()
        }
    }
    
    init(front:String,back:String,tips:[Tip]? = nil,learned:Bool = false){
        self.front = front
        self.back = back
        if let tips = tips {
            self.tips = tips
        }
        self.learned = learned
        
    }
    
    func getDescription()->String {
        var result:String = front + " -> "  + back + " [ "
        
        for (var i = 0; i <= tips.count - 2;i++){
            result += tips[i].description + ", "
        }
        let lastIndex = tips.count - 1
        if lastIndex >= 0 {
            result += tips[lastIndex].description
        }
        
        return result + " ] learned : \(learned)"
    }
    
    
}

enum Tip : CustomStringConvertible, CustomDebugStringConvertible {
    case Text(text:String),Image(path:String)
    
    var description:String {
        get {
            switch self {
            case .Text(let text):
                return text
            case .Image(let path):
                return path
                
            }
        }
    }
    
    var debugDescription: String {
        get {
            switch self {
            case .Text(let text):
                return "user's tip : \(text)"
            
            case .Image(let path):
                return "use this path (\(path))to show user his tip image"
            }
        }
    }
    
    func getDescription() ->String{
        return self.description
    }
    
    
    
}


