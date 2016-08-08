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
        let person = Person(firstName: "Hi", lastName: "Hi", streetAddress: "Hi", city: "Hi", state: "Hi", zipCode: 41515, dateOfBirth: "hhod", type: Guest.Child)
        let test = PassGenerator(entrant: person)
        test.printStuff()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

