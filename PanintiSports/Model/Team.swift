//
//  Team.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation

struct Teams: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let idTeam: Int
    let strTeam: String
    let intFormedYear: Int
    let strSport: String
    let strLeague: String
    let strStadium: String
    let strStadiumLocation: String
    let strWebsite: String
    let strTeamBadge: String
    let strDescriptionEN: String
}
