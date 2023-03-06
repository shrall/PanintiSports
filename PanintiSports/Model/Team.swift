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
    let strLeague: String?
    let strTeamBadge: String?
    let strDescriptionEN: String?
}
