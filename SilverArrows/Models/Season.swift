//
//  Season.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 17.08.22.
//

import Foundation

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
      
    
}
