//
//  PokemonPresenter.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//

import UIKit

class PokemonPresenter: ViewToPresenterPokemonProtocol {

    // MARK: Properties
    weak var view: PresenterToViewPokemonProtocol?
    var interactor: PresenterToInteractorPokemonProtocol?
    var router: PresenterToRouterPokemonProtocol?
    
    func fetchPokemon(name: String) {
        interactor?.fetchPokemon(name: name)
    }
}

extension PokemonPresenter: InteractorToPresenterPokemonProtocol {
    func didFetchPokemon(data: PokemonResponse) {
        view?.didFetchPokemon(data: data)
    }
    
}
