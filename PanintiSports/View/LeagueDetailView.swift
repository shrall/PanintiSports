//
//  LeagueDetailView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct LeagueDetailView: View {
    var leagueName: String

    @StateObject var leagueDetailVM = LeagueDetailViewModel()

    var body: some View {
        NavigationView {
            if leagueDetailVM.teams.isEmpty {
                ProgressView()
            } else {
                List(leagueDetailVM.teams, id: \.self) { team in
                    Text(team.strTeam ?? "-").onTapGesture {
                        leagueDetailVM.teamDetail = team
                        leagueDetailVM.seeDetailView = true
                    }
                }
            }
        }.onAppear {
            leagueDetailVM.leagueName = leagueName
            leagueDetailVM.fetchAllTeams()
        }
        .sheet(isPresented: $leagueDetailVM.seeDetailView) {
            TeamDetailView(leagueDetailVM: leagueDetailVM)
        }
    }
}

struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueDetailView(leagueName: "ASEAN Olympics")
    }
}
