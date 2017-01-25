//
//  InitialiseData.swift
//  Positivity365
//
//  Created by Paul Keller on 24/1/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import CoreData

class InitialiseData{
    private init(){
        
    }
    
    class func checkForData() {
        if checkYears() == false {
            createYears(newYearGroup: "2017", newLeapYear: false)
            createYears(newYearGroup: "2018", newLeapYear: false)
            createYears(newYearGroup: "2019", newLeapYear: false)
            createYears(newYearGroup: "2020", newLeapYear: true)
            
            createMonths(newMonthGroup: "January", newMaxDay: 31, newOrder: 1)
            createMonths(newMonthGroup: "February", newMaxDay: 29, newOrder: 2)
            createMonths(newMonthGroup: "March", newMaxDay: 31, newOrder: 3)
            createMonths(newMonthGroup: "April", newMaxDay: 30, newOrder: 4)
            createMonths(newMonthGroup: "May", newMaxDay: 31, newOrder: 5)
            createMonths(newMonthGroup: "June", newMaxDay: 30, newOrder: 6)
            createMonths(newMonthGroup: "July", newMaxDay: 31, newOrder: 7)
            createMonths(newMonthGroup: "August", newMaxDay: 31, newOrder: 8)
            createMonths(newMonthGroup: "September", newMaxDay: 30, newOrder: 9)
            createMonths(newMonthGroup: "October", newMaxDay: 31, newOrder: 10)
            createMonths(newMonthGroup: "November", newMaxDay: 30, newOrder: 11)
            createMonths(newMonthGroup: "December", newMaxDay: 31, newOrder: 12)
            
            for i: Int16 in 1...31 {
                createDays(newDay: i)
            }
            
            DataController.saveContext()
        }
    }
    
    private class func checkYears() -> Bool {
        let fetchRequest:NSFetchRequest<Year> = Year.fetchRequest()
        
        do {
            let searchResults = try DataController.getContext().fetch(fetchRequest)
            
            if searchResults.count <= 0 {
                return false
            } else {
                return true
            }
        } catch {
            print("Error: \(error)")
            return false
        }
    }
    
    private class func createYears(newYearGroup: String, newLeapYear: Bool) {
        let yearClassName:String! = String(describing: Year.self)
        
        let year:Year = NSEntityDescription.insertNewObject(forEntityName: yearClassName, into: DataController.getContext()) as! Year
        year.yearGroup = newYearGroup
        year.leapYear = newLeapYear
    }
    
    private class func createMonths(newMonthGroup: String, newMaxDay: Int16, newOrder: Int16) {
        let monthClassName:String! = String(describing: Month.self)
        
        let month:Month = NSEntityDescription.insertNewObject(forEntityName: monthClassName, into: DataController.getContext()) as! Month
        month.monthGroup = newMonthGroup
        month.maxDay = newMaxDay
        month.order = newOrder
    }
    
    private class func createDays(newDay: Int16) {
        let dayClassName:String! = String(describing: Day.self)
        
        let day:Day = NSEntityDescription.insertNewObject(forEntityName: dayClassName, into: DataController.getContext()) as! Day
        day.day = newDay
    }
}
