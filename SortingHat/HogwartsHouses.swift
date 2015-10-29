//
//  HogwartsHouses.swift
//  SortingHat
//
//  Created by Charles Hart on 10/20/15.
//  Copyright © 2015 busybusy. All rights reserved.
//

import UIKit


enum HogwartsHouse{
    case Slytherin
    case Hufflepuff
    case Gryffindor
    case Ravenclaw
    case Squib
    
 static func randomHouse() -> HogwartsHouse {
        
        var randomInt = Int(arc4random_uniform(UInt32(4)))
        
        let randomSquib = Int(arc4random_uniform(UInt32(100)))
        if randomSquib == 37 || randomSquib == 42 {
            randomInt = 5
        }
        
        var house:HogwartsHouse = .Squib
        switch randomInt {
        case 0 :
            house = .Gryffindor
        case 1 :
            house = .Ravenclaw
        case 2 :
            house = .Hufflepuff
        case 3 :
            house = .Slytherin
        default :
            house = .Squib
        }
        
        return house
    }
    
    func houseColor() -> UIColor {
        switch self {
        case Gryffindor : //(116,0,1)
            return UIColor(red: 116/255, green: 0/255, blue: 1/255, alpha: 1.0)
        case Ravenclaw : //(14,26,64)
            return UIColor(red: 14/255, green: 26/255, blue: 64/255, alpha: 1.0)
        case Hufflepuff : //(236,185,57)
            return UIColor(red: 236/255, green: 185/255, blue: 57/255, alpha: 1.0)
        case Slytherin : //(26,71,42)
            return UIColor(red: 26/255, green: 71/255, blue: 42/255, alpha: 1.0)
        default :
            return UIColor.darkGrayColor()
        }
    }
    
    func houseMascot() -> HogwartsMascot {
        switch self {
        case Gryffindor :
            return .Lion
        case Ravenclaw :
            return .Eagle
        case Hufflepuff :
            return .Badger
        case Slytherin : 
            return .Snake
        default :
            return .Cat
        }
    }
}


enum HogwartsMascot {
    case Lion
    case Snake
    case Eagle
    case Badger
    case Cat

}





