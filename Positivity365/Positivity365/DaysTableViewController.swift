//
//  DaysTableViewController.swift
//  Positivity365
//
//  Created by Paul Keller on 28/01/2017.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import UIKit
import CoreData

class DaysTableViewController: UITableViewController {

    var days = [Day]()
    var currentMaxDay:Int16 = 1
    var currentMonth: String!
    var currentYear: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var tbView: UITableView = self.tableView
        TableViewFunctions.formatTableView(tableView: &tbView)
        
        let fetchRequest:NSFetchRequest<Day> = Day.fetchRequest()
        fetchRequest.fetchLimit = Int(currentMaxDay)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"day", ascending: true)]
        
        do {
            let searchResults = try DataController.getContext().fetch(fetchRequest)
            
            days = searchResults
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        // Configure the cell...
        let day = days[indexPath.row]
        cell.textLabel?.text = String(day.day)
        
        let notesFetchRequest:NSFetchRequest<PositiveNote> = PositiveNote.fetchRequest()
        let yearPredicate = NSPredicate(format: "noteYear = %@", currentYear)
        let monthPredicate = NSPredicate(format: "noteMonth = %@", currentMonth)
        let dayPredicate = NSPredicate(format: "noteDay = %@", String(day.day))
        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [dayPredicate, monthPredicate, yearPredicate])
        notesFetchRequest.predicate = andPredicate
        
        do {
            let notes = try DataController.getContext().fetch(notesFetchRequest)
            if notes.count > 0 {
                TableViewFunctions.formatTableViewCell(cell: &cell, isActive: true)
            } else {
                TableViewFunctions.formatTableViewCell(cell: &cell, isActive: false)
            }
        } catch {
            print("Error: \(error)")
        }

        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "noteSegue" {
            let myNote = segue.destination as! NoteViewController
            let myPath: IndexPath = self.tableView.indexPathForSelectedRow!
            let selectedDay = days[myPath.row]
            myNote.currentDay = selectedDay.day
            myNote.currentMonth = currentMonth
            myNote.currentYear = currentYear
            
            
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
