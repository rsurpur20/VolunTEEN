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

    
    @IBOutlet weak var contactInformationInput: UITextField!
    @IBOutlet weak var locationInput: UISwitch!
    @IBOutlet weak var jobTitleInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let newOpp = PostOpp()
        if let checkForInput = descriptionInput.text, let checkForJobTitleInput = jobTitleInput.text, let checkForContactInfo = contactInformationInput.text {
            newOpp.description = checkForInput
            newOpp.remote = locationInput.isOn
            newOpp.contactInfo = checkForContactInfo
            newOpp.jobTitle = checkForJobTitleInput
        }
        previousOppTVC.listOfOpps.append(newOpp)
        previousOppTVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
