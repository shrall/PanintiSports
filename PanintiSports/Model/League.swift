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

struct League: Hashable, Codable, Comparable {
    let strLeague: String?
    let strSport: String?

    static func < (lhs: League, rhs: League) -> Bool {
        return (lhs.strSport ?? "") < (rhs.strSport ?? "")
    }
}

enum SportIcon: String {
    case athletics = "figure.rower"
    case americanFootball = "figure.american.football"
    case australianFootball = "figure.australian.football"
    case badminton = "figure.badminton"
    case baseball = "baseball"
    case basketball = "basketball"
    case cricket = "cricket.ball"
    case cycling = "bicycle.circle.fill"
    case darts = "target"
    case esports = "gamecontroller.fill"
    case equestrian = "figure.equestrian.sports"
    case extremeSports = "figure.climbing"
    case fieldHockey = "hockey.puck"
    case fighting = "figure.boxing"
    case golf = "figure.golf"
    case gymnastics = "person.circle.fill"
    case handball = "figure.handball"
    case iceHockey = "hockey.puck.fill"
    case lacrosse = "figure.lacrosse"
    case motorsport = "car.side.rear.open"
    case multiSports = "sportscourt"
    case netball = "basket"
    case olympics = "sportscourt.fill"
    case shooting = "figure.hunting"
    case skating = "figure.skating"
    case skiing = "figure.skiing.downhill"
    case snooker = "8.circle"
    case soccer = "soccerball"
    case tableTennis = "figure.table.tennis"
    case tennis = "tennisball"
    case volleyball = "volleyball"
    case waterSports = "figure.waterpolo"
    case weightlifting = "dumbbell"
    case winterSports = "snowflake"
    
    
    var symbolName: String {
        return rawValue
    }
    
    init(strSport: String) {
        switch strSport {
        case "Athletics":
            self = .athletics
        case "American Football":
            self = .americanFootball
        case "Australian Football":
            self = .australianFootball
        case "Badminton":
            self = .badminton
        case "Baseball":
            self = .baseball
        case "Basketball":
            self = .basketball
        case "Cricket":
            self = .cricket
        case "Cycling":
            self = .cycling
        case "Darts":
            self = .darts
        case "ESports":
            self = .esports
        case "Esports":
            self = .esports
        case "Equestrian":
            self = .equestrian
        case "Extreme Sports":
            self = .extremeSports
        case "Field Hockey":
            self = .fieldHockey
        case "Fighting":
            self = .fighting
        case "Golf":
            self = .golf
        case "Gymnastics":
            self = .gymnastics
        case "Handball":
            self = .handball
        case "Ice Hockey":
            self = .iceHockey
        case "Lacrosse":
            self = .lacrosse
        case "Motorsport":
            self = .motorsport
        case "Multi-sports":
            self = .multiSports
        case "Netball":
            self = .netball
        case "Olympics":
            self = .olympics
        case "Shooting":
            self = .shooting
        case "Skating":
            self = .skating
        case "Skiing":
            self = .skiing
        case "Snooker":
            self = .snooker
        case "Soccer":
            self = .soccer
        case "Table Tennis":
            self = .tableTennis
        case "Tennis":
            self = .tennis
        case "Volleyball":
            self = .volleyball
        case "Weightlifting":
            self = .weightlifting
        case "Watersports":
            self = .waterSports
        case "Wintersports":
            self = .winterSports
        default:
            self = .multiSports
        }
    }
}
