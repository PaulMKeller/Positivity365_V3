//
//  HTMLFunctions.swift
//  Positivity365
//
//  Created by Paul Keller on 7/3/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HTMLFunctions {
    
    var quotes = [PositiveThought]()
    var currentQuote: String!
    var currentAuthor: String!
    
    static func createPositiveThought() -> String {
        var currentHTML: String
        
        currentHTML = "<HTML>"
        currentHTML += "<HEAD>"
        currentHTML += "<link rel='stylesheet' href='../main.css'>"
        currentHTML += "</HEAD>"
        currentHTML += "<BODY>"
        currentHTML += "Some positive nonsence goes here - Titty McKaka"
        currentHTML += "</BODY>"
        currentHTML += "</HTML>"
        
        return currentHTML
    }
    
    private func getQuotes(){
        let fetchRequest:NSFetchRequest<PositiveThought> = PositiveThought.fetchRequest()
        
        do {
            let searchResults = try DataController.getContext().fetch(fetchRequest)
            
            quotes = searchResults
            
            if quotes.count > 0 {
                var randomIndex: UInt32 = arc4random_uniform(UInt32(quotes.count))
                currentQuote = quotes[randomIndex].thoughtText
                currentAuthor = quotes[randomIndex].author
                
            }
        } catch {
            print("Error: \(error)")
        }

    }
}
