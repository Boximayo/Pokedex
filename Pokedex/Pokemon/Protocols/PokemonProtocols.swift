//
//  PokemonProtocols.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewPokemonProtocol: AnyObject {
    var presenter: ViewToPresenterPokemonProtocol? { get set}
    
    func didFetchPokemon(data: PokemonResponse)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPokemonProtocol: AnyObject {
    var view: PresenterToViewPokemonProtocol? { get set }
    var interactor: PresenterToInteractorPokemonProtocol? { get set }
    var router: PresenterToRouterPokemonProtocol? { get set }
    
    func fetchPokemon(name: String)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPokemonProtocol: AnyObject {
    var presenter: InteractorToPresenterPokemonProtocol? { get set }
    
    func fetchPokemon(name: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPokemonProtocol: AnyObject {
    
    func didFetchPokemon(data: PokemonResponse)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPokemonProtocol {

}
