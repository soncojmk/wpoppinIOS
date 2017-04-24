//
//  AllViewController.swift
//  tabber_What'sPoppin
//
//  Created by ISHAN ATUL RANPURA on 1/8/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class AllViewController: UIViewController {
    
    var explore_selected = 0;

    @IBAction func Music_Button(_ sender: Any) {
        explore_selected = 1
        let defaults = UserDefaults.standard
        defaults.set(explore_selected, forKey: "myexplore")
        defaults.synchronize()
    }
    @IBAction func Comedy_Button(_ sender: Any) {
        explore_selected = 2
        let defaults = UserDefaults.standard
        defaults.set(explore_selected, forKey: "myexplore")
        defaults.synchronize()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
}
