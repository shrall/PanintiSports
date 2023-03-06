//
//  ContentView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView{
                HomeView()
                    .navigationTitle("Leagues")
            }.tabItem {
                Label("League", systemImage: "shield")
            }
            .tag(1)
            NavigationView{
                FavoriteView()
                    .navigationTitle("Favorite Teams")
            }.tabItem {
                Label("Favorite", systemImage: "star")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
