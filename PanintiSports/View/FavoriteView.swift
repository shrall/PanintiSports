//
//  FavoriteView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var favoriteVM = FavoriteViewModel()
    @FetchRequest(entity: Favorite.entity(), sortDescriptors: [NSSortDescriptor(key: "idTeam", ascending: true)]) var favoriteTeams: FetchedResults<Favorite>
    var body: some View {
        VStack {
            if favoriteTeams.isEmpty {
                Text("No Favorite Team")
            } else {
                List(favoriteTeams, id: \.self) { team in
                    HStack {
                        if favoriteVM.editMode {
                            favoriteVM.selectedTeams.contains(Team(idTeam: team.idTeam, strTeam: team.strTeam, strLeague: team.strLeague, strTeamBadge: team.strTeamBadge, strDescriptionEN: team.strDescriptionEN)) ? Image(systemName: "checkmark.circle.fill") :
                                Image(systemName: "circle")
                        }
                        Text(team.strTeam ?? "-")
                    }.onTapGesture {
                        if favoriteVM.editMode {
                            let selectedTeam = Team(idTeam: team.idTeam, strTeam: team.strTeam, strLeague: team.strLeague, strTeamBadge: team.strTeamBadge, strDescriptionEN: team.strDescriptionEN)
                            if favoriteVM.selectedTeams.contains(selectedTeam) {
                                if let index = favoriteVM.selectedTeams.firstIndex(of: selectedTeam) {
                                    favoriteVM.selectedTeams.remove(at: index)
                                }
                            } else {
                                favoriteVM.selectedTeams.append(selectedTeam)
                            }
                        } else {
                            let teamDetail = Team(idTeam: team.idTeam, strTeam: team.strTeam, strLeague: team.strLeague, strTeamBadge: team.strTeamBadge, strDescriptionEN: team.strDescriptionEN)
                            favoriteVM.teamDetail = teamDetail
                            favoriteVM.seeDetailView = true
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $favoriteVM.seeDetailView) {
            TeamDetailView(seeDetailView: $favoriteVM.seeDetailView, team: favoriteVM.teamDetail)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if favoriteVM.selectedTeams.isEmpty {
                        favoriteVM.editMode.toggle()
                    } else {
                        for team in favoriteVM.selectedTeams{
                            favoriteVM.unfavoriteTeam(context: viewContext, id: team.idTeam!)
                        }
                    }
                    favoriteVM.selectedTeams = [Team]()
                } label: {
                    Text(favoriteVM.selectedTeams.isEmpty ? favoriteVM.editMode ? "Done" : "Edit" : "Delete").foregroundColor(favoriteVM.selectedTeams.isEmpty ? .accentColor : .red)
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
