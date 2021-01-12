//
//  Home.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/10/21.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorScheme //to detect if the device is in darkMode or not
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                //Parallax Header
                GeometryReader{ reader -> AnyView in
                    
                    let offset = reader.frame(in: .global).minY
                    
//                    print(offset)
                    
                    if -offset >= 0{
                        DispatchQueue.main.async {
                            self.homeData.offset = -offset
                        }
                     }
                    
                    return AnyView(
                        Image("food")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0)) //drag garyo bhaney hamro offset ko height greater than 0 so offset ko height ma adjust hucha
                            .offset(y: (offset > 0 ? -offset : 0)) //position determine garna lai offset use garney, y positin  ma image mathi sardai jancha
                    )
                    
                        
                }.frame(height: 250)
                
                
                //Cards...
                Section(header: HeaderView()) {
                    
                    //Tabs with content...
                    ForEach(tabItems){ tab in 
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text(tab.tab)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom, 7)
                                .padding(.leading, 7)
                            //Cards...
                            ForEach(foods) { food in
                                
                                CardView(food: food)
                                
                            }
                            
                            Divider()
                                .padding(.top)
                            
                        })
                        .tag(tab.tab)
                        .overlay(
                            
                            GeometryReader { reader -> Text in
                                
                                let offset = reader.frame(in: .global).minY
                                print(offset)
                                
                                //Total area plus header size of 100
                                let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100
                                print(height)
                                
                                if offset < height && offset > 50 && homeData.selectedTab != tab.tab {
                                    DispatchQueue.main.async {
                                        self.homeData.selectedTab = tab.tab
                                    }
                                }
                                
                                return Text("")
                            }
                            
                        )
                    }
                    
                }
            })
        }
        .overlay(
            (colorScheme == .light ? Color.white : Color.black)
                    .frame(height:      UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .opacity(homeData.offset > 250 ? 1 : 0)
                .ignoresSafeArea(.all, edges: .top), alignment: .top
        )
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
