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
        let person = Person(firstName: "John", lastName: "Doe", streetAddress: "10 Downing Street", city: "London", state: "England", zipCode: 5451, dateOfBirth: twoDaysAgo())
        let test = PassGenerator(entrant: person, entrantType: Guest.Child)
        test.printStuff()
        do {
            try test.verifyDataIntegrity()
        } catch let error {
            print(error)
        }
        swipeAtKitchen(test)
    }

    //MARK: Swiping methods
    
    //There is no need to swipe at Amusement Areas as everybody has access. There is no need to create more methods right now as they would all look the same
    
    func swipeAtKitchen(pass: PassGenerator) {
        switch pass.entrantType {
        case is Guest:
            print("The user cannot access this area")
            if let dob = pass.entrant.dateOfBirth where compareDates(dob) == true {
                print("It is the entrant's birthday!!")
            }
        case Employee.Ride:
            print("This employee cannot access this area")
        default:
            print("Employee allowed through")
            if let dob = pass.entrant.dateOfBirth where compareDates(dob) == true {
                print("It is the entrant's birthday!!")
            }
        }
    }



    
    //MARK: Helper methods
    
    // This method serves no purpose other than testing the birthday celebration logic. When creating a person object, you can either supply NSDate() or twoDaysAgo() to see whether the logic works. This is force unwrapped but ¯\_(ツ)_/¯
    func twoDaysAgo() -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    return calendar.dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: [])!
    }
    
    func compareDates(date: NSDate) -> Bool {
        let today = NSDate()
        return NSCalendar.currentCalendar().isDate(today, equalToDate: date, toUnitGranularity: [.Day, .Month])
    }

}

