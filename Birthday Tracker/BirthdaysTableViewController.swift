//
//  BirthdaysTableViewController.swift
//  Birthday Tracker
//
//  Created by Eugene Kiselev on 30.06.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit
import CoreData

class BirthdaysTableViewController: UITableViewController {

// Список всех дней рождения:
    var birthdays = [Birthday]()
// Отображения даты в виде отформатированной строки:
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        
// Сортировка по имени:
        let sortDescriptor1 = NSSortDescriptor(key: "lastName",ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "firstName",ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        
        do {
            birthdays = try context.fetch(fetchRequest)
        } catch let error {
            print("Не удалось загрузить данные из-за ошибки: \(error).")
        }
        tableView.reloadData()
    }

// Количество секций:
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

// Количество ячеек:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }

// Что именно помещаем в каждую строку ячейки:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for:indexPath)
        let birthday = birthdays[indexPath.row]
        
        let firstName = birthday.firstName ?? ""
        let lastName = birthday.lastName ?? ""
        cell.textLabel?.text = firstName + " " + lastName
        
        if let date = birthday.birthdate as Date? {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        } else {
            cell.detailTextLabel?.text = " "
        }
        
        return cell
    }

}
