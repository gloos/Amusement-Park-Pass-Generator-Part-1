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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

