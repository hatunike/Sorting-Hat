//
//  Potion.swift
//  SortingHat
//
//  Created by Charles Hart on 10/22/15.
//  Copyright © 2015 busybusy. All rights reserved.
//

import UIKit


struct PotionRecipe {
    
    let name:String
    let description:String
    let ingredients:[Ingredient]
    let steps:[Step]
    let materials:[Material]
    let notes:String
    
    static func felixFelicis()->PotionRecipe {
        return PotionRecipe(name:"Felix Felicis",
            description:"Liquid Luck",
            ingredients: [Ingredient.ashwinderEgg()],
            steps: [Step(instruction:"Add Ashwinder egg to cauldron, then add horseradish and heat.", duration:nil, materials: [Material.cauldron()])],
            materials: [Material.cauldron()], notes: "Measure twice, mix once.");
    }
    
    func numberOfIngredients()->Int{
        return ingredients.count
        
    }
}

struct Ingredient {
    let name:String
    let description:String
    let quantity:Float
    let unit:String
    
    static func ashwinderEgg()->Ingredient {
        return Ingredient(name:"Ashwinder egg", description:"The Ashwinder eggs are extremely hot and flammable, and, if not frozen in time, will light fire to the surrounding area. They are bright red and, when frozen, very valuable.", quantity:1, unit:"Singular Freaking Egg")
    }
}

struct Step {
    let instruction:String
    let duration:Int? //Seconds
    let materials:[Material]
}

struct Material {
    let name:String
    let description:String
    
    static func cauldron()-> Material {
        return Material(name:"Cauldron", description:"Standard size Cauldron")
    }
}