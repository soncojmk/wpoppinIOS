//
//  OutExploreViewController.swift
//  tabber_What'sPoppin
//
//  Created by Test on 26/02/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class OutExploreViewController: UIViewController {
    var link_selected = 0;
    @IBAction func Music_Button(_ sender: Any) {
        link_selected = 1
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    @IBAction func Performing_Arts_Button(_ sender: Any) {
        link_selected = 2
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    @IBAction func Arts_Button(_ sender: Any) {
        link_selected = 3
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    @IBAction func Comedy_Button(_ sender: Any) {
        link_selected = 4
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    @IBAction func Poetry_Button(_ sender: Any) {
        link_selected = 5
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    @IBAction func Fundraisers_Button(_ sender: Any) {
        link_selected = 6
        let defaults = UserDefaults.standard
        defaults.set(link_selected, forKey: "mylink")
        defaults.synchronize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}
