//
//  WPLoginViewController.swift
//  tabber_What'sPoppin
//
//  Created by Apple on 15/01/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class WPLoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func Login(_ sender: Any) {
        
        let myUrl = URL(string: "http://www.wpoppin.com/api-token-auth/");
        
                var request = URLRequest(url:myUrl!)
        
                request.httpMethod = "POST"// Compose a query string
        let username1 = username.text
        let password1 = password.text
        
        let usernameStored = UserDefaults.standard.string(forKey: "username");
        let passwordStored = UserDefaults.standard.string(forKey: "password");
        
        if (usernameStored == username1)
        {
            if(passwordStored == password1){
                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                self.dismiss(animated: true, completion: nil);
            }
        }
        
                let postString = "username=\(username1!)&password=\(password1!)";
       
                request.httpBody = postString.data(using: String.Encoding.utf8);
        
                let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                    
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    print("printing http response")
                    print(httpResponse)
                
                     if (statusCode == 200 || statusCode == 201){
                        
                        UserDefaults.standard.set(username1,forKey: "username");
                        UserDefaults.standard.set(password1,forKey: "password");
                         UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                        UserDefaults.standard.synchronize();

                        
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            print("Printing json before dictionary")
                            print(json)
                          
                            for dictionary in json as! NSDictionary{
                                print("Inside the dictionary")
                             
                                let token = dictionary.value
                                UserDefaults.standard.set(token, forKey: "token")
                                print("printing the value in token")
                                print(token)
                                
                            }
                            
                            
                            
                            
                        } catch let jsonError{
                            print(jsonError)
                        }


                        OperationQueue.main.addOperation{
                            
                            self.dismiss(animated: true, completion: nil)
                            print("Poppin to the root view")
                            _ = self.navigationController?.popToRootViewController(animated: true)
                                                   }
                        
                    }
                        
                        
        
                    else if(error != nil)
                    {
                    print("error=\(error)")
                    return
                    }
                    else
                     {
                        OperationQueue.main.addOperation{
                        // create the alert
                        let alert = UIAlertController(title: "Username or Password Incorrect", message: "Please enter correct Username or Password.", preferredStyle: UIAlertControllerStyle.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                            
                            self.performSegue(withIdentifier: "IncorrectSegue", sender: nil)
                            
                        }
                    }
                    // You can print out response object
                    print("response = \(response)")
                    //Let's convert response sent from a server side script to a NSDictionary object:
                            }
                task.resume()
        
        
//            let myUrl = URL(string: "http://www.wpoppin.com/token-auth/");
//            
//            var request = URLRequest(url:myUrl!)
//            
//           // Compose a query string
//            
//            
//            let usernameStored = UserDefaults.standard.string(forKey: "username");
//            let passwordStored = UserDefaults.standard.string(forKey: "password");
//            
//            let postString = "username=user&password=user";
//            
//            request.httpBody = postString.data(using: String.Encoding.utf8);
//            
//            request.httpMethod = "POST"
//            
//            URLSession.shared.dataTask(with: myUrl!, completionHandler: { (data,response,error) in
//                
//                if error != nil {
//                    print("inside error")
//                    print(error)
//                    return
//                }
//                
//                
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                    print(json)
//                    //            for dictionary in json as! [[String: AnyObject]]{
//                    //
//                    //                print("printing json and user token")
//                    //                print(json)
//                    //                
//                    //
//                    //
//                    //                
//                    //            }
//                    
//                    
//                    
//                } catch let jsonError{
//                    print(jsonError)
//                }
//                
//                
//                
//            }).resume()

        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        print("Inside user login page")
        view.addGestureRecognizer(tap)
        self.navigationController?.isNavigationBarHidden = true;
        // Do any additional setup after loading the view.
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }



}
