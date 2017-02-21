//
//  MonthsTableViewController.swift
//  Positivity365
//
//  Created by Paul Keller on 25/1/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import UIKit
import CoreData

class MonthsTableViewController: UITableViewController {
    
    var months = [Month]()
    var isLeapYear:Bool = false
    var currentYear:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var tbView: UITableView = self.tableView
        TableViewFunctions.formatTableView(tableView: &tbView)
        
        let fetchRequest:NSFetchRequest<Month> = Month.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"order", ascending: true)]
        
        do {
            let searchResults = try DataController.getContext().fetch(fetchRequest)
            
            months = searchResults
            
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
        return months.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "monthCell", for: indexPath)

        // Configure the cell...
        let month = months[indexPath.row]
        cell.textLabel?.text = month.monthGroup
        cell.detailTextLabel?.text = String(month.maxDay)
        
        let notesFetchRequest:NSFetchRequest<PositiveNote> = PositiveNote.fetchRequest()
        let yearPredicate = NSPredicate(format: "noteYear = %@", currentYear)
        let monthPredicate = NSPredicate(format: "noteMonth = %@", month.monthGroup!)
        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [monthPredicate, yearPredicate])
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
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell", for: indexPath)
        
        monthCurrentMaxDay = Int16((cell.detailTextLabel?.text)!)!
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "daysSegue" {
            let myDaysTable = segue.destination as! DaysTableViewController
            let myPath: IndexPath = self.tableView.indexPathForSelectedRow!
            let selectedMonth = months[myPath.row]
            myDaysTable.currentMaxDay = selectedMonth.maxDay
            
            if isLeapYear == false {
                if selectedMonth.monthGroup == "February" {
                    myDaysTable.currentMaxDay = selectedMonth.maxDay - 1
                }
            }
            
            myDaysTable.currentMonth = selectedMonth.monthGroup
            myDaysTable.currentYear = currentYear
        }
        
        //let path = self.tableView.indexPathForSelectedRow
        //let maxDay = self.items[path.row]
        
        // set a variable in the second view controller with the String to pass
        
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
