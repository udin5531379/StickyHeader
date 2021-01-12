//
//  Food.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/10/21.
//

import Foundation

//Food model and sample items

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
    
}


var foods = [
    
    Food(title: "Choclate Cake", description: "There's nothing quite like the smell of fresh popped pop corn, It's that it reminds you of lost childhood and fun times.  Our pop corn machine wil pop mountains of buttered pop corn for your event.", price: "$10", image: "cc"),
    
    Food(title: "Southern Pecan Pie", description: "We make our pecan pies with fresh pecan halves, brown sugar, vanilla, and rum.We also add heavy whipping cream to our pies just before baking to give them a rich creamy consistency.", price: "$20", image: "spp"),
    
    Food(title: "Peach Cobbler", description: "Cling peaches, cinnamon, sugar, and nutmeg are just some of the ingredientswhich go into our golden brown peach cobbler.", price: "$9.99", image: "pc"),
    
    Food(title: "Orange Sherbet", description: "The perfect mid meal course or, of course the final course.  We will supply a lite orange ice sherbet with a fresh orange ring!", price: "$16", image: "os"),
    
    Food(title: "Mandarin Chocolate Cheesecake", description: "An utterly unique and delicious blend of flavors - a layer of chocolate fudge cake- a layer of fresh Mandarin Orange Marmalade - filled with creamy cheesecake, and enrobed in chocolate.", price: "$18", image: "mcc"),
    
    
]
