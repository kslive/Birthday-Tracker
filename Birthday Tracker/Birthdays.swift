//
//  Birthdays.swift
//  Birthday Tracker
//
//  Created by Eugene Kiselev on 30.06.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import Foundation

// Хранение дней рождений:
class Birthday {
    let firstName: String
    let lastName: String
    let birthdate: Date
    
    init(firstName: String, lastName: String, birthdate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
    }
}
