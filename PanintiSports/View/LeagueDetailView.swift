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
        VStack {
            if leagueDetailVM.teams.isEmpty {
                ProgressView()
            } else {
                if leagueDetailVM.listTypeGrid {
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                            ForEach(leagueDetailVM.teams, id: \.self) { team in
                                VStack{
                                    AsyncImage(url: URL(string: team.strTeamBadge ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"),
                                               content: { image in
                                                   image.resizable()
                                                       .aspectRatio(contentMode: .fit)
                                                       .frame(maxWidth: 100, maxHeight: 100)
                                               },
                                               placeholder: {
                                                   ProgressView()
                                                       .frame(width: 100, height: 100)
                                               })
                                    Text(team.strTeam ?? "-")
                                }.onTapGesture {
                                    leagueDetailVM.teamDetail = team
                                    leagueDetailVM.seeDetailView = true
                                }
                            }
                        }
                        .padding()
                    }
                } else{
                    List(leagueDetailVM.teams, id: \.self) { team in
                        Text(team.strTeam ?? "-").onTapGesture {
                            leagueDetailVM.teamDetail = team
                            leagueDetailVM.seeDetailView = true
                        }
                    }
                }
            }
        }.onAppear {
            leagueDetailVM.leagueName = leagueName
            leagueDetailVM.fetchAllTeams()
        }
        .sheet(isPresented: $leagueDetailVM.seeDetailView) {
            TeamDetailView(seeDetailView: $leagueDetailVM.seeDetailView, team: leagueDetailVM.teamDetail)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    leagueDetailVM.listTypeGrid.toggle()
                } label: {
                    Image(systemName: leagueDetailVM.listTypeGrid ? "list.bullet" : "square.grid.2x2")
                }
            }
        }
    }
}

struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueDetailView(leagueName: "ASEAN Olympics")
    }
}
