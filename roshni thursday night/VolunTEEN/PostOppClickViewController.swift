//
//  PostOppClickViewController.swift
//  VolunTEEN
//
//  Created by Roshni Surpur on 8/13/20.
//  Copyright © 2020 KWK. All rights reserved.
//

import UIKit

class PostOppClickViewController: UIViewController {
    var previousOppTVC = CompanyTableViewController()
    var selectedOpp : OppCD?
//    var selectedToDo : OppCD?
    
    @IBOutlet weak var isRemoteClicked: UILabel!
    @IBOutlet weak var descriptionClicked: UILabel!
    @IBOutlet weak var titleClicked: UILabel!
    @IBOutlet weak var contactClicked: UILabel!
    
    @IBOutlet weak var dateClicked: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleClicked.text = selectedOpp?.jobTitleAttribute
        descriptionClicked.text = selectedOpp?.descriptionAttribute
        contactClicked.text = selectedOpp?.contactInfoAttribute
        dateClicked.text = selectedOpp?.dateAttribute
        if selectedOpp?.remoteAttribute == true{
            isRemoteClicked.text = "🏠"
        }
//        else{
//            isRemoteClicked.text = "In-Person"
//
//        }
    }


    

}
