//
//  ProtectedPageViewController.swift
//  tabber_What'sPoppin
//
//  Created by Apple on 10/01/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class ProtectedPageViewController: UIViewController {

    @IBOutlet weak var UserName: UILabel!
    func someFunction() {
        let usernameStored = UserDefaults.standard.string(forKey: "username");
        self.UserName.text = String(describing: usernameStored!)
        print(usernameStored!)
        print(UserName)
    }
    
    @IBAction func PostEvent(_ sender: Any) {
        
      
        
    }
    
    @IBAction func share(_ sender: Any) {
        let link = NSURL(string: "http://wpoppin.com")
        let vc = UIActivityViewController(activityItems: ["What'sPoppin helps you discover interesting,inspiring and engaging events around Penn State.","http://wpoppin.com",link!], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
    

    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
        UserDefaults.standard.synchronize();
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    
    @IBAction func Terms(_ sender: Any) {
            UIApplication.shared.openURL(NSURL(string: "http://wpoppin.com")! as URL)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        someFunction()
        
        // Do any additional setup after loading the view.
    }
  

}
