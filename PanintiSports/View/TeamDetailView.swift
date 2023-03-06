//
//  TeamDetailView.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import CoreData
import SwiftUI

struct TeamDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var seeDetailView: Bool
    @State var starred = false
    var team: Team
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
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
                        VStack(alignment: .leading) {
                            Text(team.strTeam ?? "-").font(Font.system(size: 32, weight: .bold))
                            Text(team.strLeague ?? "-")
                        }
                        Spacer()
                    }
                    Divider().padding(.top)
                    Text("About").bold().font(Font.system(size: 24)).padding(.bottom, 4)
                    Text(team.strDescriptionEN ?? "-").padding(.bottom, 12)
                    Spacer()
                }.padding()
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        seeDetailView.toggle()
                    } label: {
                        Text("Close")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if starred {
                            unfavoriteTeam(context: viewContext, id: team.idTeam!)
                        } else {
                            favoriteTeam(context: viewContext)
                        }
                    } label: {
                        Image(systemName: starred ? "star.fill" : "star")
                    }
                }
            }.onAppear {
                starred = checkFavorite(context: viewContext, id: team.idTeam!)
            }
        }
    }
    
    func favoriteTeam(context: NSManagedObjectContext) {
        let teamDetail = Favorite(context: context)
        teamDetail.idTeam = team.idTeam
        teamDetail.strTeam = team.strTeam
        teamDetail.strLeague = team.strLeague
        teamDetail.strTeamBadge = team.strTeamBadge
        teamDetail.strDescriptionEN = team.strDescriptionEN
        starred = true
        save(context: context)
    }
    
    func unfavoriteTeam(context: NSManagedObjectContext, id: String) {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idTeam == %@", id)
        do {
            let firstFavorite = try context.fetch(fetchRequest)
            context.delete(firstFavorite[0])
            starred = false
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
    
    func checkFavorite(context: NSManagedObjectContext, id: String) -> Bool {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "idTeam == %@", id)
        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}
