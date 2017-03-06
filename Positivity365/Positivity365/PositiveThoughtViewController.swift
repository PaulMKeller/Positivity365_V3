//
//  PositiveThoughtViewController.swift
//  Positivity365
//
//  Created by Paul Keller on 6/3/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import UIKit

class PositiveThoughtViewController: UIViewController {

    @IBOutlet weak var thoughWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setCurrentThought()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setCurrentThought(){
        //Build up the HTML here or in another class
        //Set the CSS
        //Retrieve thoughts
        //Set one at random
        //Check expiry for the day to see if the note needs to change
        //Remove any webrowser bits that aren't required. I just need to see the rendered content, no navigation, no history, nothing else. Just the rendered content.
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
