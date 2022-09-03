//
//  SilverArrowsApp.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

@main
struct SilverArrowsApp: App {
    var body: some Scene {
        WindowGroup {

            
            ContentView(SeasonToPass: Season(id: 1, image: "", name: "MGP W01", season: "2010", drivers: ["Nico", "Michael"], championshipPoints: "214", teamChampionship: false, driversChampionship: false, driverChampion: ""))
                
        }
    }
}
