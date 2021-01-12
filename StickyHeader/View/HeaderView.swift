//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Udin Rajkarnikar on 1/10/21.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var colorScheme //to detect if the device is in darkMode or not
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
                
            HStack(spacing: 0){
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: getButtonSize(), height: getButtonSize())
                })
                
                Text("Udin's Bakery")
                    .font(.title)
                    .fontWeight(.bold)
            }.padding(.top, 20)
            
            ZStack{
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Asian . Korean . Italian . Indian")
                        .font(.caption)
                    
                    HStack(spacing: 7){
                        
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30-40 mins")
                            .font(.caption)
                        
                        HStack(spacing: 2) {
                            
                            Text("4.3")
                                .font(.caption)
                            
                            Image(systemName: "star.fill")
                                .font(.caption)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }).opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200)/50) : 1)
                
                //For automatic Scrolling ko lagi chahe ScrollView Reader
                ScrollViewReader { reader in
                    ScrollView(.horizontal, content: {
                        HStack{
                            ForEach(tabItems) { tabs in
                                
                                if colorScheme == .light {
                                    Text(tabs.tab)
                                        .font(.caption)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .foregroundColor(homeData.selectedTab == tabs.tab ? Color.white : Color.black)
                                        .background(Color.primary.opacity(homeData.selectedTab == tabs.tab ? 1 : 0))
                                        .clipShape(Capsule())
                                        .tag(tabs.tab)
                                        
                                } else {
                                    Text(tabs.tab)
                                        .font(.caption)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .foregroundColor(homeData.selectedTab == tabs.tab ? Color.black : Color.white)
                                        .background(Color.primary.opacity(homeData.selectedTab == tabs.tab ? 1 : 0))
                                        .clipShape(Capsule())
                                        .tag(tabs.tab)
                                        
                                }
                            }
                            .onChange(of: homeData.selectedTab, perform: { value in
                                reader.scrollTo(homeData.selectedTab, anchor: .leading)
                            })
                        }
                    })
                    
                    //tabs visible only when scrolling up
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200)/50) : 0)
                }
                
                
            }
            .frame(height: 60)
        }
        .padding(.horizontal)
        .frame(height: 120)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
    }
    
    //this function helps to get the size of the button and dissaper and appear as we scroll up and down
    func getButtonSize() -> CGFloat {
        if homeData.offset > 200 {
            
            let x = (homeData.offset - 200) / 50
            
            if x <= 1.0{
                return x * 40
            } else {
                return 40
            }
        
        } else {
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
