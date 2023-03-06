//
//  TeamDetailView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct TeamDetailView: View {
    var leagueDetailVM: LeagueDetailViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: leagueDetailVM.teamDetail.strTeamBadge ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"),
                                   content: { image in
                                       image.resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(maxWidth: 100, maxHeight: 100)
                                   },
                                   placeholder: {
                                       ProgressView()
                                           .frame(width: 100, height: 100)
                                   })
                        VStack(alignment: .leading) {
                            Text(leagueDetailVM.teamDetail.strTeam ?? "-").font(Font.system(size: 32, weight: .bold))
                            Text(leagueDetailVM.teamDetail.strLeague ?? "-")
                        }
                        Spacer()
                    }
                    Divider().padding(.top)
                    Text("About").bold().font(Font.system(size: 24)).padding(.bottom, 4)
                    Text(leagueDetailVM.teamDetail.strDescriptionEN ?? "-").padding(.bottom, 12)
                    Spacer()
                }.padding()
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        leagueDetailVM.seeDetailView.toggle()
                    } label: {
                        Text("Close")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("fav")
                    } label: {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(leagueDetailVM: LeagueDetailViewModel())
    }
}
