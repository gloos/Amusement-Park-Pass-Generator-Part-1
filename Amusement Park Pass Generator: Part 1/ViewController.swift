//
//  ViewController.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Gary Luce on 08/08/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var sound: SystemSoundID = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Here we create the pass based on the information filled in project 5
        let person = Person(firstName: "John", lastName: "Doe", streetAddress: "10 Downing Street", city: "London", state: "England", zipCode: 5451, dateOfBirth: twoDaysAgo())
       // let person2 = Person(firstName: "Tom", lastName: "Mennard", streetAddress: "home", city: "Beijing", state: "China", zipCode: 1234, dateOfBirth: NSDate())
        let pass = PassGenerator(entrant: person, entrantType: Guest.Child)
        pass.printEntrant()
        do {
            try pass.verifyDataIntegrity()
        } catch let error {
            print(error)
        }
        swipeAtKitchen(pass)
    }

    //MARK: Swiping methods
    
    //There is no need to swipe at Amusement Areas as everybody has access. There is no need to create more methods right now as they would all look the same
    
    func swipeAtKitchen(pass: PassGenerator) {
        switch pass.entrantType {
        case is Guest:
            print("The user cannot access this area")
            playDeniedAccessSound()
            if let dob = pass.entrant.dateOfBirth where compareDates(dob) == true {
                print("You can't access, but happy birthday anyway")
            }
        case Employee.Ride:
            playDeniedAccessSound()
            print("This employee cannot access this area")
        default:
            print("Employee allowed through")
            playGrantedAccessSound()
            if let dob = pass.entrant.dateOfBirth where compareDates(dob) == true {
                print("It is the entrant's birthday!!")
            }
        }
    }



    
    //MARK: Helper methods
    // Extra credit #1
    // This method serves no purpose other than testing the birthday celebration logic. When creating a person object, you can either supply NSDate() or twoDaysAgo() to see whether the logic works. This is force unwrapped but ¯\_(ツ)_/¯
    func twoDaysAgo() -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    return calendar.dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: [])!
    }
    
    func compareDates(date: NSDate) -> Bool {
        let today = NSDate()
        return NSCalendar.currentCalendar().isDate(today, equalToDate: date, toUnitGranularity: [.Day, .Month])
    }
    
    
    //Extra credit #2
    func playGrantedAccessSound() {
        self.sound = 0
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("grantedAccess", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &self.sound)
        AudioServicesPlaySystemSound(self.sound)
        
    }

    func playDeniedAccessSound() {
        self.sound = 0
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("dniedAccess", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &self.sound)
        AudioServicesPlaySystemSound(self.sound)
        
    }
}

