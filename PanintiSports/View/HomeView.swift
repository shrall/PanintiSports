//
//  HomeView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
        if homeVM.leagues.isEmpty {
            ProgressView().onAppear {
                homeVM.fetchAllLeagues()
            }
        } else {
            List(homeVM.leagues, id: \.self) { league in
                LeagueRow(league: league)
            }
        }
    }
}

struct LeagueRow: View {
    let league: League
    var body: some View {
        NavigationLink(destination: {
            LeagueDetailView(leagueName: league.strLeague ?? "-").navigationTitle(league.strLeague ?? "-")
        }, label: {
            HStack {
                Image(systemName: SportIcon(strSport: league.strSport ?? "-").symbolName)
                    .foregroundColor(.primary)
                Text(league.strLeague ?? "-")
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
