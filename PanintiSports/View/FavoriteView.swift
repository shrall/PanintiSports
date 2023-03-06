//
//  FavoriteView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var favoriteVM = FavoriteViewModel()
    @FetchRequest(entity: Favorite.entity(), sortDescriptors: [NSSortDescriptor(key: "idTeam", ascending: true)]) var favoriteTeams: FetchedResults<Favorite>
    var body: some View {
        VStack {
            if favoriteTeams.isEmpty {
                Text("No Favorite Team")
            } else {
                if favoriteVM.listTypeGrid {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                            ForEach(favoriteTeams, id: \.self) { team in
                                VStack {
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
                                    let teamDetail = Team(idTeam: team.idTeam, strTeam: team.strTeam, strLeague: team.strLeague, strTeamBadge: team.strTeamBadge, strDescriptionEN: team.strDescriptionEN)
                                    favoriteVM.teamDetail = teamDetail
                                    favoriteVM.seeDetailView = true
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    List(favoriteTeams, id: \.self) { team in
                        Text(team.strTeam ?? "-").onTapGesture {
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
                    favoriteVM.listTypeGrid.toggle()
                } label: {
                    Image(systemName: favoriteVM.listTypeGrid ? "list.bullet" : "square.grid.2x2")
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
