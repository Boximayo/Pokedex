//
//  PokemonInteractor.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//

import UIKit

class PokemonInteractor: PresenterToInteractorPokemonProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterPokemonProtocol?
    
    func fetchPokemon(name: String) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self](data, response, error) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                self?.presenter?.didFetchPokemon(data: response)
            }catch let error {
                print(error)
            }
                
            
        }

        task.resume()
    }
}
