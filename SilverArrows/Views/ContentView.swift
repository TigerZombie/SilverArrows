//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var F1season = SeasonModel()
    
    @State private var pictureWidthUnselected: CGFloat = 132
    @State private var pictureHeightUnselected: CGFloat = 95
    @State private var pictureWidthSelected: CGFloat = 330
    @State private var pictureHeightSelected: CGFloat = 129
    
    var logoWidth: CGFloat = 260
    
    @State private var idSelection: Int = 0
    
    @State private var searchIsExpanded: Bool = true
    @State private var championshipSelected: Bool = false
    @State private var sliderValue: Float = 0
   
    
    
    var body: some View {
        
        ZStack {
            
            // Background Color
            CustomColors.overallBackground
                .edgesIgnoringSafeArea(.all)
            
            // Scrollview on top of background color, hidden indicators
            ScrollView (showsIndicators: false) {
                
                // Stack of Mercedes logo, search bars and cards
                VStack{
                    
                    // Mercedes Logo
                    Image("LogoAMGPetronas")
                        .resizable()
                        .scaledToFit()
                        .frame(width: logoWidth)
                        .padding(.bottom, 16)
                    
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
                                    sliderValue = 0
                                }
                                searchIsExpanded.toggle()
                            }
                            
                            
                            if searchIsExpanded {
                    // Search bars: Slider, Toggle
                    VStack {
                        
                        VStack (alignment: .center){
                            Text("Minimum championship points:  \(Int(sliderValue))")
                                
                        Slider(value: $sliderValue, in: 0...765, step: 1)
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
                        
                       
                        if idSelection == s.id {
                           
                            
                            // View for expanded card
                            
                            ZStack (alignment: .top){
                                
                                
                                VStack (spacing: 0){
                                    
                                    // invisible background item on left side, to align the right side item (the part with text). Also: Will provide the shadow below the picture.
                                    RoundedCornersTop()
                                        .foregroundColor(.white)
                                        .frame(width: pictureWidthSelected, height: pictureHeightSelected)
                                        .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                                    
                                    
                                    ZStack {
                                        
                                        // the part of the card with text
                                        RoundedCornersBottom()
                                            .fill(CustomColors.cardBackground)
                                            .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                                        VStack  {
                                            // Centering the car name and season
                                            HStack {
                                                Spacer()
                                                VStack {
                                                    Text(s.name)
                                                        .font(.customFontTitle)
                                                        .foregroundColor(CustomColors.cardText)
                                                    
                                                    Text("\(s.season) season")
                                                        .font(.customFontBody)
                                                        .foregroundColor(CustomColors.cardText)
                                                }
                                                Spacer()
                                            }
                                            HStack {
                                                
                                                VStack (alignment: .leading) {

                                                    
                                                    HStack {
                                                        Text("Drivers:")
                                                        ForEach (s.drivers, id: \.self) { driver in
                                                            Text("\(driver)")
                                                        }
                                                    }
                                                    .font(.customFontBody)
                                                    .foregroundColor(CustomColors.cardText)
                                                    
                                                    HStack {
                                                        Text("Championship Points:")
                                                        Text(s.championshipPoints)
                                                    }
                                                    .font(.customFontBody)
                                                    .foregroundColor(CustomColors.cardText)
                                                    
                                                    if s.teamChampionship == true {
                                                        HStack {
                                                            Text("Team Championship")
                                                            Image(systemName: "rosette")
                                                                .foregroundColor(Color.yellow)
                                                        }
                                                        .font(.customFontBody)
                                                        .foregroundColor(CustomColors.cardText)
                                                    }
                                                    
                                                    if s.driversChampionship == true {
                                                        HStack {
                                                            Text("Driver Champion: \(s.driverChampion)")
                                                            Image(systemName: "rosette")
                                                                .foregroundColor(Color.yellow)
                                                        }
                                                        .font(.customFontBody)
                                                        .foregroundColor(CustomColors.cardText)
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                                // Pushing the text to the leading edge
                                                Spacer()
                                            }
                                            .padding(.top, 10)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        .padding(.horizontal)
                                        // Next padding will define the bottom part of the card, automatically adjusting it to what is needed by the VStack (text)
                                        .padding([.top, .bottom])
                                        
                                    }
                                    .frame(width: pictureWidthSelected)
                                }
                                
                                
                                // Image with shadow only to the right side (cropped with mask modifier)
                                Image("\(s.season) \(s.name)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: pictureWidthSelected, height: pictureHeightSelected)
                                    .clipShape(RoundedCornersTop())
                                    .shadow(color: .black, radius: 4, x: 0, y: 4)
                                    .mask(Rectangle().padding(.bottom, -14))
                                
                                
                            }
                            
                        
                                .padding(.horizontal)
                                .padding(.bottom, 8)

                        }
                      
                        
                        else {
                            
                            // View for collapsed card
                            
                            ZStack (alignment: .leading){
                                
                                
                                HStack (spacing: 0){
                                    
                                    // invisible background item on left side, to align the right side item (the part with text). Also: Will provide the shadow below the picture.
                                    RoundedCornersLeft()
                                        .foregroundColor(.white)
                                        .frame(width: pictureWidthUnselected)
                                        .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                                    
                                    
                                    ZStack{
                                        
                                        // the part of the card with text
                                        RoundedCornersRight()
                                            .fill(CustomColors.cardBackground)
                                            .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                                        VStack {
                                            Text(s.name)
                                                .font(.customFontTitle)
                                                .foregroundColor(CustomColors.cardText)
                                            
                                            Text("\(s.season) season")
                                                .font(.customFontBody)
                                                .foregroundColor(CustomColors.cardText)
                                        }
                                    }
                                    
                                    .frame(width: 198)
                                }
                                
                                
                                // Height of complete card
                                .frame(height: pictureHeightUnselected)
                                
                                
                                // Image with shadow only to the right side (cropped with mask modifier)
                                Image("\(s.season) \(s.name)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: pictureWidthUnselected, height: pictureHeightUnselected)
                                    .clipShape(RoundedCornersLeft())
                                    .shadow(color: .black, radius: 4, x: 4)
                                    .mask(Rectangle().padding(.trailing, -10))
                            }
                                
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
        ContentView()
            .preferredColorScheme(.dark)
    }
}
