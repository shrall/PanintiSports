//
//  FavoriteViewModel.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation
import SwiftUI

class FavoriteViewModel: ObservableObject{
    @Published var teamDetail: Team = .init(idTeam: "", strTeam: "", strLeague: "", strTeamBadge: "", strDescriptionEN: "")
    @Published var seeDetailView = false
    @Published var listTypeGrid = false
}
