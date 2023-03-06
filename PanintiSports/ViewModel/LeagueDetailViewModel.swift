//
//  TeamListViewModel.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import CoreData
import Foundation

class LeagueDetailViewModel: ObservableObject {
    var leagueName: String = ""
    var constant = Constants()
    
    @Published var teams = [Team]()
    @Published var teamDetail: Team = .init(idTeam: "", strTeam: "", strLeague: "", strTeamBadge: "", strDescriptionEN: "")
    @Published var seeDetailView = false
    @Published var listTypeGrid = false

    func fetchAllTeams() {
        let url = URL(string: constant.baseURL + "search_all_teams.php?l=" + leagueName.replacingOccurrences(of: " ", with: "%20"))
        let task = URLSession.shared.dataTask(with: url!) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let meta = try JSONDecoder().decode(Teams.self, from: data)
                DispatchQueue.main.async {
                    self?.teams = meta.teams
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
