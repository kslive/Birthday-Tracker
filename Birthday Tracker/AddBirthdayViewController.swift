//
//  AddBirthdayViewController.swift
//  Birthday Tracker
//
//  Created by Eugene Kiselev on 30.06.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class AddBirthdayViewController: UIViewController {

    @IBOutlet var firstNameTextField:  UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdatePicker.maximumDate = Date()
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
// Получаем данные введенные пользователем:
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let birthdate = birthdatePicker.date
        
// Формируем экземпляр класса:
        let newBirthday = Birthday(firstName: firstName,
                                   lastName: lastName,
                                   birthdate: birthdate)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

