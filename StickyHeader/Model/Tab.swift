//
//  Tab.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/10/21.
//

import Foundation

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabItems = [
    
    Tab(tab: "Order Again", foods: foods.shuffled()),
    Tab(tab: "Picked For You", foods: foods.shuffled()),
    Tab(tab: "Starters", foods: foods.shuffled()),
    Tab(tab: "Weekly Picks", foods: foods.shuffled())
    
]
