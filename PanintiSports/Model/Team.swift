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

struct Team: Hashable, Codable {
    let idTeam: String?
    let strTeam: String?
    let intFormedYear: String?
    let strSport: String?
    let strLeague: String?
    let strStadium: String?
    let strStadiumLocation: String?
    let strWebsite: String?
    let strTeamBadge: String?
    let strDescriptionEN: String?
}
