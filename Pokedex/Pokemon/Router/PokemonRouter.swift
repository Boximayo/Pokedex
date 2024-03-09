//
//  PokemonRouter.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//

import UIKit

class PokemonRouter {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PokemonViewController()
        let interactor = PokemonInteractor()
        let router = PokemonRouter()
        let presenter = PokemonPresenter()
        
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
}

extension PokemonRouter: PresenterToRouterPokemonProtocol  {
}
