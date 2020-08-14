//
//  VolunteerPostOppClickViewController.swift
//  VolunTEEN
//
//  Created by Roshni Surpur on 8/13/20.
//  Copyright © 2020 KWK. All rights reserved.
//
import EventKit
import UIKit

class VolunteerPostOppClickViewController: UIViewController {
    

    
    var previousOppTVCVolunteer = VolunteerOppTableViewController()
    var selectedOppVolunteer : OppCD?
    
    @IBOutlet weak var volunteerDateClicked: UILabel!
    @IBOutlet weak var volunteerRemoteClicked: UILabel!
    @IBOutlet weak var volunteerContactInfoClicked: UILabel!
    @IBOutlet weak var volunteerDescriptionClicked: UILabel!
    @IBOutlet weak var volunteerJobTitleClicked: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        volunteerJobTitleClicked.text = selectedOppVolunteer?.jobTitleAttribute
        volunteerDescriptionClicked.text = selectedOppVolunteer?.descriptionAttribute
        volunteerContactInfoClicked.text = selectedOppVolunteer?.contactInfoAttribute
        volunteerDateClicked.text = selectedOppVolunteer?.dateAttribute
//        volunteerRemoteClicked.text = "🏠"
//            var checker = selectedOppVolunteer
            if  selectedOppVolunteer?.remoteAttribute == true{
                volunteerRemoteClicked.text = "🏠 "
            }
        
//        print("heyo")

    }
//    func insertEvent(store: EKEventStore) {
////        print(selectedOppVolunteer?.dateAttribute)
//
//        // 1
//        let calendars = store.calendars(for: .event)
//
//        for calendar in calendars {
//            // 2
//            if calendar.title == "Ioscreator" {
//
//                // 3
////                let startDate = Date()
//                // 2 hours
////                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
//
//                // 4
//                let event = EKEvent(eventStore: store)
//                event.calendar = calendar
//
//                event.title = volunteerJobTitleClicked.text
////                let time = dateInput.date
////                let formatter = DateFormatter()
////                formatter.dateStyle = .short
////                formatter.timeStyle = .short
////
////                let datetime = formatter.string(from: time)
////                print(datetime)
////                newOpp.dateAttribute = datetime
////                event.startDate = selectedOppVolunteer?.dateAttribute
//////                event.endDate = endDate
//
//                // 5
//                do {
//                    try store.save(event, span: .thisEvent)
//                }
//                catch {
//                   print("Error saving event in calendar")             }
//                }
//        }
//    }
    

    
 func insertEvent(store: EKEventStore) {
     // 1
     let calendars = store.calendars(for: .event)
         
     for calendar in calendars {
         // 2
         if calendar.title == "Ioscreator" {
             
             // 3
//             let startDate = Date()
             // 2 hours
//             let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                 
             // 4
             let event = EKEvent(eventStore: store)
             event.calendar = calendar
            event.title = volunteerJobTitleClicked.text
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/dd/yy, HH:mm a"
            let date = dateFormatter.date(from: volunteerDateClicked.text!)
//             event.title = "New Meeting"
             event.startDate = date
            event.endDate = date?.addingTimeInterval(2 * 60 * 60)
                 
             // 5
             do {
                 try store.save(event, span: .thisEvent)
                let alert = UIAlertController(title: "Calendar Confirmation", message: "'\(volunteerJobTitleClicked.text!)' has been added to your calendar at \(volunteerDateClicked.text!)", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                self.present(alert, animated: true)
             }
             catch {
                print("Error saving event in calendar")             }
             }
     }
 }
 
    @IBAction func addCalendar(_ sender: Any) {
//        print(volunteerDateClicked.text)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "M/dd/yy, HH:mm a"
//        var check = dateFormatter.date(from: volunteerDateClicked.text!)
//        print(check)
        
        // 1
               let eventStore = EKEventStore()
                   
               // 2
               switch EKEventStore.authorizationStatus(for: .event) {
               case .authorized:
                   insertEvent(store: eventStore)
                   case .denied:
                       print("Access denied")
                   case .notDetermined:
                   // 3
                       eventStore.requestAccess(to: .event, completion:
                         {[weak self] (granted: Bool, error: Error?) -> Void in
                             if granted {
                               self!.insertEvent(store: eventStore)
                             } else {
                                   print("Access denied")
                             }
                       })
                       default:
                           print("Case default")
               }
    }
    

}
