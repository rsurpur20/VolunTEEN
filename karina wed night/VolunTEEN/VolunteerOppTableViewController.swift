//
//  VolunteerOppTableViewController.swift
//  VolunTEEN
//
//  Created by Karina on 8/12/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class VolunteerOppTableViewController: UITableViewController {
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
        return listOfOpps.count
    }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifiertwo", for: indexPath)
        
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
           let eachOpp = listOfOpps[indexPath.row]
           performSegue(withIdentifier: "move", sender: eachOpp)
      }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddOpp = segue.destination as? AddOppViewController {
            nextAddOpp.previousOppTVCVolunteer = self

        }
        if let nextCompletedOppVC = segue.destination as? VolunteerPostOppClickViewController {
             if let choosenOpp = sender as? OppCD {
                  nextCompletedOppVC.selectedOppVolunteer = choosenOpp
                  nextCompletedOppVC.previousOppTVCVolunteer = self
             }
        }

    }
    



}
