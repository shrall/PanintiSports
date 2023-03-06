//
//  HomeViewModel.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    var constant = Constants()
    
    @Published var leagues = [League]()

    func fetchAllLeagues() {
        let url = URL(string: constant.baseURL + "all_leagues.php")
        let task = URLSession.shared.dataTask(with: url!) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let meta = try JSONDecoder().decode(Leagues.self, from: data)
                DispatchQueue.main.async {
                    self?.leagues = meta.leagues.sorted()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
