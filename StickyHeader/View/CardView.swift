//
//  CardView.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/10/21.
//

import SwiftUI

struct CardView: View {
    var food: Food
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10, content: {
                Text(food.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.caption)
                
                Text(food.price)
                    .fontWeight(.bold)
            })
            
            Spacer(minLength: 10)
            
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 130, height: 130)
                .cornerRadius(10)
        } .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
