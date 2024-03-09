//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Mayo Gonzalez ortega on 08/03/24.
//

import UIKit
import Foundation

// MARK: - pokemonResponse
struct PokemonResponse: Codable {
  
    let id: Int?
    let name: String?
    let sprites: Sprites?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}
// MARK: - Sprites
class Sprites: Codable {

    let other: Other?

}

struct Other: Codable {
    let officialArtwork: OfficialArtwork?
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
       
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}













