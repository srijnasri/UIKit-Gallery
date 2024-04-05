//
//  LaunchTableViewController.swift
//  JournalMe
//
//  Created by Srijnasri Negi on 26/03/24.
//

import UIKit

enum Components: String, CaseIterable {
    case UIButton
    case UIdatePicker
    case UIStepper
    case UISlider
    case UISwitch
    case UITextField
}

class LaunchTableViewController: UITableViewController {

    let components: [Components] = Components.allCases.map { $0 }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIkit components"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        // To extend the separator to the edge
        tableView.separatorInset = .zero
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return components.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = components[indexPath.row].rawValue
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(GenericViewController(selectedComponent: components[indexPath.row]), animated: true)
//        switch  {
//        case .UIButton:
//            
//        case .UISlider:
//            print("this is slider")
//        case .UIStepper:
//            print("This is stepper")
//        case .UISwitch:
//            print("this is switch")
//        case .UIdatePicker:
//            print("this is picker")
//        case .UITextField:
//            print("this is text field")
//        }
    }
}
