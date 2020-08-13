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
    var selectedOpp = PostOpp()
    
    @IBOutlet weak var isRemoteClicked: UILabel!
    @IBOutlet weak var descriptionClicked: UILabel!
    @IBOutlet weak var titleClicked: UILabel!
    @IBOutlet weak var contactClicked: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleClicked.text = selectedOpp.jobTitle
        descriptionClicked.text = selectedOpp.description
        contactClicked.text = selectedOpp.contactInfo
        
        if selectedOpp.remote == true{
            isRemoteClicked.text = "🏠"
        } else{
            isRemoteClicked.text = "In-Person"

        }
    }
    
    

}
