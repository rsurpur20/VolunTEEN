//
//  CompanyTableViewController.swift
//  VolunTEEN
//
//  Created by Karina on 8/12/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {

    var listOfOpps : [OppCD] = []
    
    
    func getOpps() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(OppCD.fetchRequest()) as? [OppCD] {
              listOfOpps = dataFromCoreData
              tableView.reloadData()
              }
         }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(OppCD.fetchRequest()) as? [OppCD] {
              listOfOpps = dataFromCoreData
              tableView.reloadData()
              }
         }
 
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfOpps.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let eachOpp = listOfOpps[indexPath.row]
        cell.textLabel?.text = eachOpp.jobTitleAttribute
        cell.detailTextLabel?.text = eachOpp.descriptionAttribute
        
        if let thereIsDescription = eachOpp.jobTitleAttribute {
             if eachOpp.remoteAttribute {
           cell.textLabel?.text = "🏠" + thereIsDescription
            } else {
           cell.textLabel?.text = eachOpp.jobTitleAttribute
            }
        }
        


        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
         getOpps()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachOpp = listOfOpps[indexPath.row]

         performSegue(withIdentifier: "movetwo", sender: eachOpp)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddOpp = segue.destination as? AddOppViewController {
            nextAddOpp.previousOppTVC = self
            
        }
        if let nextCompletedOppVC = segue.destination as? PostOppClickViewController {
             if let choosenOpp = sender as? OppCD {
                  nextCompletedOppVC.selectedOpp = choosenOpp
                  nextCompletedOppVC.previousOppTVC = self
             }
        }

    }


}
