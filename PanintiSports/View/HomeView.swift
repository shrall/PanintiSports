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
        if homeVM.leagues.isEmpty{
            ProgressView().onAppear {
                homeVM.fetchAllLeagues()
            }
        }else{
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(homeVM.leagues, id: \.self) { league in
                        NavigationLink(destination: {
                            Text(league.strLeague ?? "-")
                        }, label: {
                            HStack{
                                Text(league.strLeague ?? "-").foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        })
                        Divider()
                    }
                }.padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}