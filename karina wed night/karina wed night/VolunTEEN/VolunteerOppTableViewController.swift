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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           // this gives us a single ToDo
           let eachOpp = listOfOpps[indexPath.row]

           performSegue(withIdentifier: "moveToCompletedOppVC", sender: eachOpp)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddOpp = segue.destination as? VolunteerPostOppClickViewController {
            nextAddOpp.previousOppTVCVolunteer = self

        }
        if let nextCompletedOppVC = segue.destination as? VolunteerPostOppClickViewController {
             if let choosenOpp = sender as? OppCD {
                  nextCompletedOppVC.selectedOppVolunteer = choosenOpp
                  nextCompletedOppVC.previousOppTVCVolunteer = self
             }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
         getOpps()
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
