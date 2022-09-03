//
//  Season.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 17.08.22.
//

import Foundation
import SwiftUI

class Season: Identifiable, Decodable {
    
    var id: Int
    var image: String
    var name: String
    var season: String
    var drivers: [String]
    var championshipPoints: String
    var teamChampionship: Bool
    var driversChampionship: Bool
    var driverChampion: String
    
    
    init(id: Int, image: String, name: String, season: String, drivers: [String], championshipPoints: String, teamChampionship: Bool, driversChampionship: Bool, driverChampion: String) {
        self.id = id
        self.image = image
        self.name = name
        self.season = season
        self.drivers = drivers
        self.championshipPoints = championshipPoints
        self.teamChampionship = teamChampionship
        self.driversChampionship = driversChampionship
        self.driverChampion = driverChampion
    }
}
