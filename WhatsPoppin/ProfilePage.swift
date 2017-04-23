//
//  ProfilePage.swift
//  WhatsPoppin
//
//  Created by Owner on 3/26/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class ProfilePage: UIViewController {

    @IBAction func editButton(_ sender: Any) {
        
        if(!userBio.isUserInteractionEnabled)
        {
            userBio.isUserInteractionEnabled = true
            userLocation.isUserInteractionEnabled = true
            userBio.layer.borderWidth = 0.3
            userLocation.layer.borderWidth = 0.3
        }
        else if (userBio.isUserInteractionEnabled)
        {   userBio.layer.borderWidth = 0
            userLocation.layer.borderWidth = 0
            userBio.isUserInteractionEnabled = false
        }
        
    }
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userLocation: UITextField!
    @IBOutlet weak var userBio: UITextField!
    @IBOutlet weak var eventsPosted: UITextField!
    @IBOutlet weak var userFollowing: UITextField!
    @IBOutlet weak var userFollowers: UITextField!
    
    func fetchData(){
        
//        let url = URL(string: "http://wpoppin.com/api/myaccount/")!    // URL(string: "http://www.example.com/")!
//        // Add one parameter
//        //let urlWithParams = scriptUrl + "?userName=\(userNameValue!)"
//        // Create NSURL Ibject
//        
//        print("Inside fetchData")
//        
//      //  let myUrl = NSURL(string: scriptUrl);
//        
//        // Create URL Request
//        let request = NSMutableURLRequest(url:url);
//        
//        // Set request HTTP method to GET. It could be POST as well
//        request.httpMethod = "GET"
//        
//        // If needed you could add Authorization header value
//        // Add Basic Authorization
//        /*
//         let username = "Token "
//         let password = "a9edb73eb1ecfa66b87037cbfeada07406749f96"
//         let loginString = NSString(format: "%@:%@", username, password)
//         let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
//         let base64LoginString = loginData.base64EncodedString(options: NSData.Base64EncodingOptions())
//         request.setValue(base64LoginString, forHTTPHeaderField: "Authorization")
//        */
//        
//        // Or it could be a single Authorization Token value
//        
//
//        
//        //request.addValue("text/html", forHTTPHeaderField: "Content-Type")
//        request.addValue("Token a9edb73eb1ecfa66b87037cbfeada07406749f96", forHTTPHeaderField: "Authorization")
//        
//        
//
//
//        // Execute HTTP Request
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//            
//            print("Inside task before error")
//            
//            let httpResponse = response as! HTTPURLResponse
//            let statusCode = httpResponse.statusCode
//            print("Printing stack")
//            print(statusCode)
//            print("printing http response")
//            print(httpResponse)
//            
//            
//            // Check for error
//            if error != nil
//            {
//                print("error=\(error)")
//                return
//            }
//            
//            // Print out response string
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            //print("responseString = \(responseString)")
//            
//            
//            // Convert server json response to NSDictionary
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                for dictionary in json as! [[String: AnyObject]] {
//                    
//                    print("Printing out dictionary")
//                    
//                    // Print out dictionary
//                    print(dictionary)
//                    
//                    // Get value by key
//                    
//                    let firstNameValue = dictionary["userName"] as? String
//                    print("\n\n\n\n\n\nPrinting username \n\n\n\n\n")
//                    print(firstNameValue!)
//                    
//                }
//            } catch let error as NSError {
//                print("Printing description")
//                print(error.localizedDescription)
//            }
//            
//        }
//        
//        task.resume()
// 
 
//        print("Inside Fetch data")
//        let url = URL(string: "http://wpoppin.com/api/myaccount/")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.setValue("Token a9edb73eb1ecfa66b87037cbfeada07406749f96", forHTTPHeaderField: "Authorization")
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No data")
//                print("Inside localized description")
//                return
//            }
//            
//            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(responseString)")
//            
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                print(responseJSON)
//                print("Inside JSON response")
//            }
//        }
//        
//        task.resume()
     
        
        
        let json: [String: Any] = ["about":"how is this"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://www.wpoppin.com/api/myaccount/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // insert json data to the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Token a9edb73eb1ecfa66b87037cbfeada07406749f96", forHTTPHeaderField: "Authorization")
        


        
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            
            
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print("printing status code")
            print(statusCode)
            print("printing http response")
            print(httpResponse)

            
            // parse the result as JSON, since that's what the API provides
            do {
                                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                                for dictionary in json as! [[String: AnyObject]] {
                
                                    print("Printing out dictionary")
                
                                    // Print out dictionary
                                    print(dictionary)
                                    
                                  //   event.titleLabel = dictionary["title"] as? String
                                    //  event.priceLabel = String(dictionary["price"]! as! Int)
                                    //  event.thumbnailImageView = dictionary["image"] as? String
                                    
                            //     let blogs = json["blogs"] as? [[String: Any]] {
//                                        for blog in blogs {
//                                            if let name = blog["name"] as? String {
//                                                names.append(name)
//                                            }
                                    
                                //    let num_following = String(dictionary["num_following"]! as! Int)
                                    
//                                    let language = parsedData["Language"] as! [String:Any]
//                                    print(language)
//                                    let field = language["Field"] as! [[String:Any]]
//                                    let name = field[0]["Name"]!
                                   if let user = dictionary["user"] as? [String:Any]
                                    {
                                    let email = user["email"] as? String
                                        print("Printing email")
                                        print(email!)
                                        let id = String(user["id"]! as! Int)
                                        let username = user["username"] as? String
                                        print("printing id")
                                        print(id)
                                        print("printing username")
                                        print(username!)
                                        self.userName.text = username
                                    }
                       //            let num_requesting = String(dictionary["id"]! as! Int)
                                  let num_followers = String(dictionary["num_followers"]! as! Int)
                                    print("printing the number of followers")
                                    print(num_followers)
                                    let avatar = dictionary["image"] as? String
                                    let about = dictionary["about"] as? String
                                    print("printing about")
                                    self.userBio.text = about
                                  //  self.userBio.text = about
                                   let college = Int((dictionary["college"] as? String)!)
                                    print(college!)
                                    if(college == 1)
                                    {
                                        self.userLocation.text = "Penn State"
                                    }
                                    
                              //      print("printing college")
                                 //   print(college)
//                                    print("printing avatar")
//                                    print(avatar)
                                    let urlName = dictionary["url"] as? String
                                    
                                    if let avatarImageUrl = avatar{
                                        let url = NSURL(string: avatarImageUrl)
                                        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
                                            if error != nil{
                                                print(error)
                                                return
                                            }
                                            DispatchQueue.main.async(execute: {
                                                self.userAvatar.image = UIImage(data: data!)
                                            })
                                        }).resume()
                                    }
//
//
//                                    
                                    
//                                    print("Printing the values we got from the server")
//                                    print(num_following)
//                                    print(email)
//                                    print(id)
//                                    print(username)
//                                    print(num_requesting)
//                                    print(num_followers)
                                    print(about!)
                                //    print(avatar!)
                                    print(url)
                               //     print(college)
                                    
                
                                    // Get value by key
//                
//                                    let firstNameValue = dictionary["userName"] as? String
//                                    print("\n\n\n\n\n\nPrinting username \n\n\n\n\n")
//                                    print(firstNameValue!)
                                    
                                }
                            } catch let error as NSError {
                                print("Printing description")
                                print(error.localizedDescription)
                            }
        }
        task.resume()
    }
        
    
        
        
        func updatePatch(){
            
          
            
            let token = "a9edb73eb1ecfa66b87037cbfeada07406749f96"
            
            let json: [String: Any] = ["about":"how is joe doing", "college":"1"]
            
                    let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
                    // create post request
                    let url = URL(string: "http://www.wpoppin.com/api/accounts/1/")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "PATCH"
            
                    // insert json data to the request
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
            
            
                    request.httpBody = jsonData
            
            
                    let task = URLSession.shared.dataTask(with: request) {
                        (data, response, error) in
                        // check for any errors
                        guard error == nil else {
                            print("error calling GET on /todos/1")
                            print(error!)
                            return
                        }
            
            
                        // make sure we got data
                        guard let responseData = data else {
                            print("Error: did not receive data")
                            return
                        }
            
                        let httpResponse = response as! HTTPURLResponse
                        let statusCode = httpResponse.statusCode
                        print("printing status code")
                        print(statusCode)
                        print("printing http response")
                        print(httpResponse)
            
            
                        // parse the result as JSON, since that's what the API provides
                                           }
                    task.resume()
                }

    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        updatePatch()
    
        // Do any additional setup after loading the view.
    }

}
