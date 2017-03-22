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
        currentHTML += setCSS()
        currentHTML += "</HEAD>"
        currentHTML += "<BODY>"
        currentHTML += setQuote()
        currentHTML += "</BODY>"
        currentHTML += "</HTML>"
        
        print(currentHTML)
        
        return currentHTML
    }
    
    static func setCSS() -> String {
    
        var myCSS: String
    
        myCSS = "<style type='text/css'>"
        
        
        myCSS += "body {"
        myCSS += "   font-family: cursive;"
        myCSS += "   font-size: x-large;"
        myCSS += "   font-weight: bold;"
        myCSS += "}"
        
        myCSS += ".quote {"
        myCSS += "   float: center;"
        myCSS += "}"
        
        
        myCSS += "</style>"
    
        return myCSS

    }
    
    static func setQuote() -> String{
        
        var myQuote: String
        
        myQuote = "<div id='quote'>"
        myQuote += "Some positive nonsence goes here - Titty McKaka"
        myQuote += "</div>"
        
        return myQuote
    }
    
    static func setBackgroundImage() -> String {
        var myBackgroundImage: String
        
        myBackgroundImage = "<div id='backgroudImage'>"
        myBackgroundImage = "</div>"
        
        return myBackgroundImage
    }
    
    /*
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
    */
}
