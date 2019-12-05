//
//  TableViewController.swift
//  Mock app Test Category Kiok
//
//  Created by Steven Hertz on 12/5/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let allProfiles = ["Profile-CTG-first", "Profile-CTG-second", "Profile-CTG-third", "Profile-Kiosk-first", "Profile-Kiosk-second", "Profile-Kiosk-third", "Profile-Kiosk-fourth", "Profile-Kiosk-fifth"]
    
    var ctgProfiles = [String]()
    var kioskProfiles = [String]()

    var navBarSegmentedControl = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        ctgProfiles = allProfiles.filter {$0.contains("CTG") }
        kioskProfiles = allProfiles.filter {$0.contains("Kiosk") }

        
        navBarSegmentedControl = UISegmentedControl(items: ["Category", "Kiosk"])
        navBarSegmentedControl.sizeToFit()
        navBarSegmentedControl.tintColor = UIColor(red:0.99, green:0.00, blue:0.25, alpha:1.00)
        navBarSegmentedControl.selectedSegmentIndex = 0
        navBarSegmentedControl.addTarget(self, action: #selector(ViewController.segmentedValueChanged(_:)), for: .valueChanged)
        // segment.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "ProximaNova-Light", size: 15)!], for: .normal)
        self.navigationItem.titleView = navBarSegmentedControl
        
        print(navBarSegmentedControl.selectedSegmentIndex)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch navBarSegmentedControl.selectedSegmentIndex {
        case 0:
            return ctgProfiles.count
        case 1:
            return kioskProfiles.count
        default:
            return 0
        }

    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        switch navBarSegmentedControl.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = ctgProfiles[indexPath.row]
        case 1:
            cell.textLabel?.text = kioskProfiles[indexPath.row]
        default:
            break
        }


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
