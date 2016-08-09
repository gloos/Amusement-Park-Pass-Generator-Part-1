//
//  ViewController.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Gary Luce on 08/08/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let person = Person(firstName: "John", lastName: "Doe", streetAddress: "10 Downing Street", city: "London", state: "England", zipCode: nil, dateOfBirth: nil)
        let test = PassGenerator(entrant: person, entrantType: Guest.Child)
        test.printStuff()
        do {
            try test.verifyDataIntegrity()
        } catch let error {
            print(error)
        }

    }

    //MARK: Swiping methods
    
    //There is no need to swipe at Amusement Areas as everybody has access. There is no need to create more methods right now as they would all look the same
    
    func swipeAtKitchen(pass: PassGenerator) {
        switch pass.entrantType {
        case is Guest:
            print("The user cannot access this area")
        case Employee.Ride:
            print("This employee cannot access this area")
        default:
            print("Employee allowed through")
        }
    }


}

