//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var F1season = SeasonModel()
    
    @State private var idSelection: Int = 0
    
    @State var SeasonToPass: Season
    
    var logoWidth: CGFloat = 260
    
    
    var body: some View {
        
        ZStack {
            
            // Background Color
            CustomColors.overallBackground
                .edgesIgnoringSafeArea(.all)
            
            // Scrollview on top of background color, hidden indicators
            ScrollView (showsIndicators: false) {
                
                // Stack of Mercedes logo and cards
                VStack{
                    
                    // Mercedes Logo
                    Image("LogoAMGPetronas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: logoWidth)
                        .padding(.bottom, 16)
                    
                    
                    // List of cards
                    
                    ForEach (F1season.seasons) { s in
                        
                        
                        
                        if idSelection == s.id {
                           
                            // View for expanded card
                            
                            ExpandedCardView(s: $SeasonToPass)
                                
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                                .onAppear {
                                    SeasonToPass = s
                                }
                        }
                      
                        
                        else {
                            
                            // View for collapsed card
                            
                            CollapsedCardView(s: $SeasonToPass)
                                
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                               
                                .onTapGesture {
                                    idSelection = s.id
                                }
                            
                        }
                        
                    }
                    
                    }
                }
            
        }
     
    }
    
    
    // to check the font names
    //    init() {
    //        for family in UIFont.familyNames {
    //            print(family)
    //            for fontname in UIFont.fontNames(forFamilyName: family) {
    //                print("--\(fontname)")
    //            }
    //        }
    //    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(SeasonToPass: Season(id: 1, image: "", name: "MGP W01", season: "2010", drivers: ["Nico1", "Michael2"], championshipPoints: "214", teamChampionship: false, driversChampionship: false, driverChampion: ""))
            .preferredColorScheme(.dark)
    }
}
