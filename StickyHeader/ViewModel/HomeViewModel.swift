//
//  HomeViewModel.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/11/21.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var offset: CGFloat = 0.0
    
    @Published var selectedTab = tabItems.first?.tab

}
