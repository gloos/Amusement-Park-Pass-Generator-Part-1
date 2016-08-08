//
//  PassGenerator.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Gary Luce on 08/08/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

class PassGenerator {

    let entrant: Person
    
    init(entrant: Person) {
        self.entrant = entrant
    }
    
    func printStuff() {
        print(entrant)
    }

    
}