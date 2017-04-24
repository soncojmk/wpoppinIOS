//
//  SignupViewController.swift
//  tabber_What'sPoppin
//
//  Created by Apple on 15/01/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var RepeatPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
            //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.dismissKeyboard))
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)
             self.navigationController?.isNavigationBarHidden = true;
    }

    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
        @IBAction func SignUp(_ sender: UIButton) {
            let username1 = username.text
            let password1 = password.text
            let email1 = email.text
            let RepeatPassword1 = RepeatPassword.text
            print("Not in Password loop")
            if(password1==RepeatPassword1)
            {    print("In Password loop")
                let myUrl = URL(string: "http://www.wpoppin.com/api/wp/auth/register/");
                
                var request = URLRequest(url:myUrl!)
                
                request.httpMethod = "POST"// Compose a query string
                
                let postString = "username=\(username1!)&email=\(email1!)&password=\(password1!)";
                
                request.httpBody = postString.data(using: String.Encoding.utf8);
                
                let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                    
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                     print("Before status code")
                    if (statusCode == 200 || statusCode == 201){
                        
    
                        UserDefaults.standard.set(username1,forKey: "username");
                        UserDefaults.standard.set(password1,forKey: "password");
                        UserDefaults.standard.set(true,forKey:"isUserLoggedIn");

                        UserDefaults.standard.synchronize();
                         print("In status code before pop to root")
                        OperationQueue.main.addOperation{
                           
                            
                            self.dismiss(animated: true, completion: nil);
                            
                        _ = self.navigationController?.popToRootViewController(animated: true)
                            print("Popping to the root")
                         //   self.performSegue(withIdentifier: "signupSegueIdentifier", sender: nil)
                        }
                        
                    }
                    
                    else if(statusCode == 400 || statusCode == 500)
                    {
                        print("Username or Email is not unique")
                        OperationQueue.main.addOperation{
                        let alert = UIAlertController(title: "Username or Email not unique.", message: "The username or the email that you are trying to create is not available. If you just signed up, proceed to the login screen.", preferredStyle: UIAlertControllerStyle.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                        }
                        
                    }

                        
                    else if(error != nil)
                    {
                        print("error=\(error)")
                        return
                    }
                    
                    else
                    {   print("inside the else out side queue add operation")
                        OperationQueue.main.addOperation{
                            // create the alert
                            let alert = UIAlertController(title: "Information Incorrect", message: "Please enter correct information.", preferredStyle: UIAlertControllerStyle.alert)
                             print("inside else and queue operation")
                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                    
                    // You can print out response object
                    print("response = \(response)")
                    
                    //Let's convert response sent from a server side script to a NSDictionary object:
                }
                task.resume()
                
            }
            
            else if(password1 != RepeatPassword1)
            {
                print("password is not equal to the repeat password")
                let alert = UIAlertController(title: "Password and Repeat Password do not match", message: "Password and Repeat Password need to be the same", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
    
    

 

}
