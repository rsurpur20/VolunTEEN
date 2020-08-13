//
//  VolunteerPostOppClickViewController.swift
//  VolunTEEN
//
//  Created by Roshni Surpur on 8/13/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class VolunteerPostOppClickViewController: UIViewController {
    var previousOppTVCVolunteer = VolunteerOppTableViewController()
    var selectedOppVolunteer : OppCD?
    @IBOutlet weak var volunteerRemoteClicked: UILabel!
    @IBOutlet weak var volunteerContactInfoClicked: UILabel!
    @IBOutlet weak var volunteerDescriptionClicked: UILabel!
    @IBOutlet weak var volunteerJobTitleClicked: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        volunteerJobTitleClicked.text = selectedOppVolunteer?.jobTitleAttribute
        volunteerDescriptionClicked.text = selectedOppVolunteer?.descriptionAttribute
        volunteerContactInfoClicked.text = selectedOppVolunteer?.contactInfoAttribute
        
        if selectedOppVolunteer?.remoteAttribute == true{
            volunteerRemoteClicked.text = "🏠"
        } else{
            volunteerRemoteClicked.text = "In-Person"

        }
    }
    

 

}
