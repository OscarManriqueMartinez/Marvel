//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Óscar Manrique on 20/9/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import XCTest
@testable import Marvel

class MarvelTests: XCTestCase {
    
    private let spiderman: Hero = Hero(
        groups: "Avengers, formerly the Secret Defenders, \"New Fantastic Four\", the Outlaws",
        height: "1.77m",
        name: "Spiderman",
        realName: "Peter Benjamin Parker",
        photo: "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg",
        power: "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.",
        abilities: "Peter is an accomplished scientist, inventor and photographer.")
    
    private let hero2: Hero = Hero(
        groups: "Avengers, formerly Queen\'s Vengeance, Starjammers",
        height: "1.80m",
        name: "Captain Marvel",
        realName: "Carol Danvers",
        photo: "https://i.annihil.us/u/prod/marvel/i/mg/c/10/537ba5ff07aa4/standard_xlarge.jpg",
        power: "Ms. Marvel\'s current powers include flight, enhanced strength, durability and the ability to shoot concussive energy bursts from her hands.",
        abilities: "Ms. Marvel is a skilled pilot & hand to hand combatant")
    
    
    func testGetHeroCache() {
        
        // Given
        let dataManager = HeroesListDataManager(apiClient: nil, heroes: [spiderman])
        
        // When
        dataManager.getHeroes(success: { (heroes) in
            
            // Then
            XCTAssertEqual(self.spiderman.name, heroes[0].name)
        }){ _ in }
    }
    
    func testGetHeroApi() {
        
        // Given
        let heroes = Heroes(superheroes: [hero2])
        let testHeroesListAPIClient = TestHeroesListAPIClient(heroes: heroes)
        let dataManager = HeroesListDataManager(apiClient: testHeroesListAPIClient, heroes: nil)
        
        // When
        dataManager.getHeroes(success: { (heroes) in
            
            // Then
            XCTAssertEqual(self.hero2.name, heroes[0].name)
        }){ _ in }
    }
}



class TestHeroesListAPIClient: HeroesListAPIClient {
    
    let heroes: Heroes
    
    
    init(heroes: Heroes) {

        self.heroes = heroes
    }
    
    override func getHeroes(success: @escaping (Heroes) -> Void, failure: @escaping (BaseError) -> Void) {
        
        success(self.heroes)
    }
}

