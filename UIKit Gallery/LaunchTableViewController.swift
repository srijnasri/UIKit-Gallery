//
//  LaunchTableViewController.swift
//  JournalMe
//
//  Created by Srijnasri Negi on 26/03/24.
//

import UIKit

class LaunchTableViewController: UITableViewController {

    let components = ["UIButton", "UIdatePicker", "UIStepper"]
    
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
        cell.textLabel?.text = components[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch components[indexPath.row] {
        case "UIButton":
            print("Yayy")
        default:
            print("On no")
        }
    }
}
