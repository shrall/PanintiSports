//
//  HomeViewModel.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var leagues = [League]()
    var constant = Constants()
    
    func fetchAllLeagues() {
        var url = URL(string: constant.baseURL + "all_leagues.php")
        let task = URLSession.shared.dataTask(with: url!) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                print("data", data)
                let meta = try JSONDecoder().decode(Leagues.self, from: data)
                print("meta", meta)
                DispatchQueue.main.async {
                    self?.leagues = meta.leagues
                }
                print("meta", meta)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
