//
//  Model.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Gary Luce on 08/08/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

protocol Entrant {
    
}

protocol FullyNamed {
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
}

protocol PartiallyNamed {
    var firstName: String? { get }
    var lastName: String? { get }
    var streetAddress: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zipCode: Int? { get }
    var dateOfBirth: String? { get }
}

class Staff: FullyNamed {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class Guest: PartiallyNamed {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var dateOfBirth: String?
}



enum EntrantType: Entrant {
    case ClassicGuest, VIPGuest, ChildGuest, HourlyEmployeeFood, HourlyEmployeeRide, HourlyEmployeeMaintenance, Manager
}
