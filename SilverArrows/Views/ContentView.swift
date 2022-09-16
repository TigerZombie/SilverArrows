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
    
    var logoWidth: CGFloat = 260
    
    @State private var pictureWidthSelected: CGFloat = 330
    @State private var searchIsExpanded: Bool = false
    @State private var championshipSelected: Bool = false
    @State private var championshipPointsSelected: Float = 0
    
    @State private var championshipPointsForSlider: Int = 100
    
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
                    // When view appears, calculate max championship points (will be used in the slider in the search pane)
                        .onAppear {
                            detectMaxPoints()
                        }
                    
                    // Search bar
                                        ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                                .stroke(CustomColors.cardShadow, lineWidth: 2.5)
                                        
                                            VStack (alignment: .leading) {
                                                HStack{
                                            Text("Search Pane")
                                                    .font(.customFontTitle)
                                                    .foregroundColor(CustomColors.cardText)
                                                    
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "chevron.down")
                                                        .font(.customFontTitle)
                                                        .foregroundColor(CustomColors.cardText)
                                                        .rotationEffect(.degrees(searchIsExpanded ? 0 : 90))
                                                        .animation(.easeOut, value: searchIsExpanded)
                                                        
                                                }
                                                .padding()
                                                .onTapGesture {
                                                    if searchIsExpanded == true {
                                                        championshipSelected = false
                                                        championshipPointsSelected = 0
                                                        idSelection = 0
                                                    }
                                                    searchIsExpanded.toggle()
                                                }
                                                
                                                
                                                if searchIsExpanded {
                                        // Search bars: Slider, Toggle
                                        VStack {
                                            
                                            VStack (alignment: .center){
                                                Text("Minimum championship points:  \(Int(championshipPointsSelected))")
                                                    
                                                Slider(value: $championshipPointsSelected, in: 0...Float(championshipPointsForSlider), step: 1)
                                                    .tint(CustomColors.cardShadow)
                                                    .padding(5)
                                                    .background(Capsule().fill(CustomColors.cardBackground))
                                                    
                                            }
                                            
                                            Toggle(isOn: $championshipSelected) {
                                                Text("Only team championship seasons")
                                                    
                                            }
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 7)
                                            .background(Capsule().fill(CustomColors.cardBackground))
                                            .tint(CustomColors.cardShadow)
                                        }
                                        .font(.customFontBody)
                                        .foregroundColor(CustomColors.cardText)
                                        .padding(.vertical, 10)
                                        .frame(width: pictureWidthSelected)
                                        
                                            }
                                            } .animation(.default.delay(0.2), value: searchIsExpanded)
                                        }
                                        .animation(.easeInOut(duration: 0.3), value: searchIsExpanded)
                                        .frame(width: pictureWidthSelected)

                    
                    
                    // List of cards
                    
                    ForEach (F1season.seasons) { s in
                        
                        // Filter to show only the seasons with team championship
                        if championshipSelected == true && championshipPointsSelected == 0 {

                        if s.teamChampionship == true {

                            
                            if idSelection == s.id {

                                // View for expanded card

                                ExpandedCardView(s: s)

                                    .padding(.horizontal)
                                    .padding(.bottom, 8)

                            }


                            else {

                                // View for collapsed card

                                CollapsedCardView(s: s)

                                    .padding(.horizontal)
                                    .padding(.bottom, 8)
                                    
                                    .onTapGesture {
                                        idSelection = s.id
                                    }


                        }

                        }
                        }
                        
                        // championship points filter applied
                       else if championshipSelected == false && championshipPointsSelected >= 1 {
                            if Float(s.championshipPoints) ?? 0 >= championshipPointsSelected {

                                if idSelection == s.id {

                                    // View for expanded card

                                    ExpandedCardView(s: s)

                                        .padding(.horizontal)
                                        .padding(.bottom, 8)

                                }


                                else {

                                    // View for collapsed card

                                    CollapsedCardView(s: s)

                                        .padding(.horizontal)
                                        .padding(.bottom, 8)

                                        .onTapGesture {
                                            idSelection = s.id
                                        }


                            }

                            }
                        }
                        
                        // championship and championship points
                        else if championshipSelected == true && championshipPointsSelected >= 1 {
                            
                            if s.teamChampionship == true && Float(s.championshipPoints) ?? 0 >= championshipPointsSelected {

                                if idSelection == s.id {

                                    // View for expanded card

                                    ExpandedCardView(s: s)

                                        .padding(.horizontal)
                                        .padding(.bottom, 8)

                                }


                                else {

                                    // View for collapsed card

                                    CollapsedCardView(s: s)

                                        .padding(.horizontal)
                                        .padding(.bottom, 8)

                                        .onTapGesture {
                                            idSelection = s.id
                                        }


                            }

                            }
                            
                        }
                        
                        // No filter applied
                        else {
                            if idSelection == s.id {
                                
                                // View for expanded card
                                
                                ExpandedCardView(s: s)
                                
                                    .padding(.horizontal)
                                    .padding(.bottom, 8)
                                
                            }
                            
                            
                            else {
                                
                                // View for collapsed card
                                
                                CollapsedCardView(s: s)
                                
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
    
    
    // loop over all seasons to determine maximum championship points
    func detectMaxPoints() {
        for season in F1season.seasons {
            if Int(season.championshipPoints) ?? 0 > championshipPointsForSlider {
                championshipPointsForSlider = Int(season.championshipPoints) ?? 100
            }
            else {
                championshipPointsForSlider = championshipPointsForSlider
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           .preferredColorScheme(.dark)
    }
}
