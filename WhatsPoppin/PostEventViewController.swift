//
//  PostEventViewController.swift
//  tabber_What'sPoppin
//
//  Created by Test on 07/03/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class PostEventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var CategoryPickerView: UIPickerView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView!
    var categories = ["Music","Fundraisers","Comedy","Poetry","Dance","Health/Wellbeing","Theatre","Art","Films","Performing Arts","Sports","Political","Debate","Gaming","Lecture","Academic","Professional","Other"]
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var StatePickerView: UIPickerView!
    
    @IBAction func nextPageButton(_ sender: Any) {
        
        let category1 = 1
        let title1 = titleTextField.text
        let city1 = cityTextField.text
        let streetAddress1 = streetAddressTextField.text
        let description1 = DescriptionTextView.text
        let state1 = "PA"
        
        UserDefaults.standard.set(category1,forKey:"category");
        UserDefaults.standard.set(title1,forKey:"title");
        UserDefaults.standard.set(city1,forKey:"city");
        UserDefaults.standard.set(streetAddress1,forKey:"streetAddress");
        UserDefaults.standard.set(description1,forKey:"description");
        UserDefaults.standard.set(state1,forKey:"state");
    }
    var state = ["Alaska","Alabama","Arkansas","American Samoa","Arizona","California","Colorado","Connecticut","District of Columbia","Delaware","Florida","Georgia","Guam","Hawaii","Iowa","Idaho","Illinois","Indiana","Kansas","Kentucky","Louisiana","Massachusetts","Maryland","Maine","Michigan","Minnesota","Missouri","Mississippi","Montana","North Carolina"," North Dakota","Nebraska","New Hampshire","New Jersey","New Mexico","Nevada","New York","Ohio","Oklahoma","Oregon","Pennsylvania","Puerto Rico","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Virginia","Virgin Islands","Vermont","Washington","Wisconsin","West Virginia","Wyoming"]
        
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = categories.count
        
        if pickerView == StatePickerView{
            countrows = self.state.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == CategoryPickerView{
            let titleRow = categories[row]
            return titleRow
        }
        else if pickerView == StatePickerView{
            let titleRow = state[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == CategoryPickerView{
            self.categoryTextField.text = self.categories[row]
         //   self.CategoryPickerView.isHidden = true
        }
        else if pickerView == StatePickerView{
            self.stateTextField.text = self.state[row]
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.categoryTextField){
           self.CategoryPickerView.isHidden = false
        }
        if (textField == self.stateTextField){
            self.StatePickerView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PostEventViewController.dismissPickerView))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        let myColor : UIColor = UIColor.lightGray
        DescriptionTextView.layer.borderColor = myColor.cgColor
       DescriptionTextView.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
    }
    
    func dismissPickerView() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        self.CategoryPickerView.isHidden = true
        self.StatePickerView.isHidden = true
    }

    

   
}
