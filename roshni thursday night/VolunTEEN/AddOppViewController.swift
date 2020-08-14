//
//  AddOppViewController.swift
//  VolunTEEN
//
//  Created by Karina on 8/12/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class AddOppViewController: UIViewController {

    var previousOppTVC = CompanyTableViewController()
    var previousOppTVCVolunteer = VolunteerOppTableViewController()
//    var selectedOppVolunteer : OppCD?

    
    @IBOutlet weak var contactInformationInput: UITextField!
    @IBOutlet weak var locationInput: UISwitch!
    @IBOutlet weak var jobTitleInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextView!
    
    @IBOutlet weak var dateInput: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
         return
         }
        //this line stores the information from Core Data into the object (dataFromCoreData) that we can access.
             let dataFromCoreData = accessToCoreData.persistentContainer.viewContext

        //this line creates an empty object that is the same data type as the ToDoCD entry within Core Data.  This means this object will have all the properties of ToDoCD.
             let newOpp = OppCD(context: dataFromCoreData)

        //these lines give the object information from the user input
             newOpp.descriptionAttribute = descriptionInput.text
             newOpp.remoteAttribute = locationInput.isOn
        newOpp.jobTitleAttribute = jobTitleInput.text
        newOpp.contactInfoAttribute = contactInformationInput.text
        
//        print(dateInput.date)
        let time = dateInput.date
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        let datetime = formatter.string(from: time)
        print(datetime)
        newOpp.dateAttribute = datetime
        //This is like clicking "save"! Our new object is now safe in Core Data!
             accessToCoreData.saveContext()

        //this send the user back to the Table View Controller
             navigationController?.popViewController(animated: true)
            
    
        }



}
