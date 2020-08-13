//
//  CompanyTableViewController.swift
//  VolunTEEN
//
//  Created by Karina on 8/12/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {

    var listOfOpps : [PostOpp] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfOpps.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let eachOpp = listOfOpps[indexPath.row]
        cell.textLabel?.text = eachOpp.jobTitle
        cell.detailTextLabel?.text = eachOpp.description
        
        if eachOpp.remote {
            cell.textLabel?.text = "🏠" + eachOpp.jobTitle
        } else      {
            cell.textLabel?.text = eachOpp.jobTitle
            }


        //display stuff:
        
        
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachOpp = listOfOpps[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachOpp)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddOpp = segue.destination as? AddOppViewController {
            nextAddOpp.previousOppTVC = self
            
        }
        if let nextCompletedOppVC = segue.destination as? PostOppClickViewController {
             if let choosenOpp = sender as? PostOpp {
                  nextCompletedOppVC.selectedOpp = choosenOpp
                  nextCompletedOppVC.previousOppTVC = self
             }
        }

    }

}
