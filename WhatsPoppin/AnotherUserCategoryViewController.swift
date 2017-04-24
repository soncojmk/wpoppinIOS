//
//  UserCategoriesViewController.swift
//  tabber_What'sPoppin
//
//  Created by Test on 18/02/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class AnotherUserCategoryViewController: UIViewController {
    
    @IBOutlet weak var Choose_Categories: UILabel!
    var category_selected = Array(repeating: 0.0, count: 14)
    
    @IBAction func Music_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {
            button.backgroundColor = UIColor.black
            category_selected[0] = 1;
        }
        else
        {   category_selected[0] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Sports_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[1] = 2;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[1] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Fundraisers_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[2] = 3;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[2] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Dance_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[3] = 4;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[3] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Performing_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[4] = 6;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[4] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Art_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[5] = 8;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[5] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Professional_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[6] = 11;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[6] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Films_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[7] = 12;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[7] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Comedy_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[8] = 13;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[8] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func Poetry_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[9] = 14;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[9] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func Lectures_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[10] = 17;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[10] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func Health_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[11] = 19;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[11] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func Gaming_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[12] = 20;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[12] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func Political_Selected(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        
        if(button.isSelected == true)
        {   category_selected[13] = 21;
            button.backgroundColor = UIColor.black
        }
        else
        {   category_selected[13] = 0;
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func Submit(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(category_selected, forKey: "myarray")
        UserDefaults.standard.set(true,forKey:"Categories_Selected");
        UserDefaults.standard.synchronize();
        defaults.synchronize()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.topItem?.title = "What'sPoppin";
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
}

