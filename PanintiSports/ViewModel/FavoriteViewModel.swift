//
//  FavoriteViewModel.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation
import CoreData
import SwiftUI

class FavoriteViewModel: ObservableObject{
    @Published var teamDetail: Team = .init(idTeam: "", strTeam: "", strLeague: "", strTeamBadge: "", strDescriptionEN: "")
    @Published var seeDetailView = false
    @Published var editMode = false
    @Published var selectedTeams = [Team]()
    
    func unfavoriteTeam(context: NSManagedObjectContext, id: String) {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idTeam == %@", id)
        do {
            let firstFavorite = try context.fetch(fetchRequest)
            context.delete(firstFavorite[0])
            save(context: context)
        } catch {
            fatalError("Uh, fetch problem...")
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {}
    }
}
