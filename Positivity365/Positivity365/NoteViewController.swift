//
//  NoteViewController.swift
//  Positivity365
//
//  Created by Paul Keller on 04/02/2017.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

    @IBOutlet var noteDate: UIDatePicker!
    @IBOutlet var noteText: UITextView!
    
    @IBAction func saveNote(_ sender: Any) {
        
        
    }
    
    var notes = [PositiveNote]()
    var currentMonth: String!
    var currentYear: String!
    var currentDay: Int16!
    var mNoteText: String!
    var currentNote: PositiveNote!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the datepicker values
        // Set the text if it exists
        
        setUpControls()
    }
    
    func setUpControls(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        let compiledDate: String = "\(currentYear!)/\(currentMonth!)/\(currentDay!)"
        let reqdDateTime = formatter.date(from: compiledDate)
        noteDate.setDate(reqdDateTime!, animated: true)
        
        let fetchRequest:NSFetchRequest<PositiveNote> = PositiveNote.fetchRequest()
        let dayPredicate = NSPredicate(format: "noteDay = %@", currentDay)
        let monthPredicate = NSPredicate(format: "noteMonth = %@", currentMonth)
        let yearPredicate = NSPredicate(format: "noteYear = %@", currentYear)
        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [dayPredicate, monthPredicate, yearPredicate])
        fetchRequest.predicate = andPredicate
        
        do {
            let searchResults = try DataController.getContext().fetch(fetchRequest)
            
            notes = searchResults
            
            if notes.count > 0 {
                // set the note text
                currentNote = notes[0]
                mNoteText = notes[0].noteText
            } else {
                //This should be a hint text but I can't seem to set that at the moment...
                mNoteText = "Enter your note here"
            }
        } catch {
            print("Error: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
