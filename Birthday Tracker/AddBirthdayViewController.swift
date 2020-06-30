//
//  AddBirthdayViewController.swift
//  Birthday Tracker
//
//  Created by Eugene Kiselev on 30.06.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit;
import CoreData

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

// Контекст управляемого объекта:
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate as NSDate? as Date?
        newBirthday.birthdayId = UUID().uuidString
        if let uniqueId = newBirthday.birthdayId {
            print("birthdayId: \(uniqueId)")
        }
        
// Сохранение:
        do{
            try context.save()
        } catch let error {
            print("Не удалось сохранить из-за ошибки \(error).")
        }
    
    
        dismiss(animated: true, completion: nil)
    }
    
// Закрытие представления по нажатию:
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

