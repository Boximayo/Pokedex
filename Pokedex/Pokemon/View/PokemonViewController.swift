//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//
import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
    
    var presenter: ViewToPresenterPokemonProtocol?
    
    var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buttonChangePokemon: UIButton = {
        let button = UIButton()
        button.setTitle("Mostrar Pokemon", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timer: Timer?
 
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        // First load the view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        view.backgroundColor = .lightGray
        timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        presenter?.fetchPokemon(name: "pikachu")
        // Second Call the services
    }
    
    @objc func timerAction() {
        print("El temporizador se ha disparado")
        presenter?.fetchPokemon(name: "\(Int.random(in: 1...150))")
    }
    
    func setupView() {
        
        view.addSubview(pokemonImage)
        view.addSubview(nameLabel)
        view.addSubview(buttonChangePokemon)
            
        NSLayoutConstraint.activate([
        
            pokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonImage.heightAnchor.constraint(equalToConstant: 300),
            pokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 20),
            
            buttonChangePokemon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonChangePokemon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
       
        ])
        
        buttonChangePokemon.addTarget(self, action: #selector(timerAction), for: .touchUpInside)
        
    }

}

extension PokemonViewController: PresenterToViewPokemonProtocol{
    func didFetchPokemon(data: PokemonResponse) {
        print(data)
        DispatchQueue.main.async {
            self.nameLabel.text = data.name
            guard let url = URL(string: data.sprites?.other?.officialArtwork?.frontDefault ?? "") else{
                return
            }
            self.pokemonImage.kf.setImage(with: url)
        }
      
    }
    
    // TODO: Implement View Output Methods
}



