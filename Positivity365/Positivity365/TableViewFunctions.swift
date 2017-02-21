//
//  TableViewFunctions.swift
//  Positivity365
//
//  Created by Paul Keller on 21/2/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import UIKit

class TableViewFunctions{
    static func formatTableViewCell(cell: inout UITableViewCell, isActive:Bool) {
        cell.contentView.backgroundColor = ApplicationConstants.cellColours.clearCellColour
        cell.backgroundColor = ApplicationConstants.cellColours.clearCellColour
        
        if(isActive) {
            //cell.imageView?.image = UIImage(named:"happy+faces+yellow.png")
            cell.backgroundView = UIImageView(image: UIImage(named: "happy+faces+yellow.png")!)
            cell.textLabel?.textColor = UIColor.white
        } else {
            //cell.imageView?.image = UIImage(named:"happy25percentopaque.png")
            cell.backgroundView = UIImageView(image: UIImage(named: "happy25percentopaque.png")!)
            cell.textLabel?.textColor = UIColor.black
        }
        
        cell.backgroundView?.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    static func formatTableView(tableView: inout UITableView) {
        tableView.backgroundView = UIImageView(image: UIImage(named:"Positive-Thinking.jpg")!)
    }
}
