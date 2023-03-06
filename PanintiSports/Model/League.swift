//
//  League.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation

struct Leagues: Codable {
    let leagues: [League]
}

struct League: Hashable, Codable {
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
}
