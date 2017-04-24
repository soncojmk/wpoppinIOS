//
//  Page2PostEventViewController.swift
//  tabber_What'sPoppin
//
//  Created by Test on 08/03/17.
//  Copyright © 2017 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

func createDirectory(){
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
    if !fileManager.fileExists(atPath: paths){
        try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        print("Directory Created")
    }else{
        print("Already directory created.")
    }
}

func getDocumentsURL() -> NSURL {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return documentsURL as NSURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().appendingPathComponent(filename)
    return fileURL!.path
    
}


class Page2PostEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var ticketLinkTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
     let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            }
            else
            {
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
            self.present(imagePickerController, animated: true, completion: nil)
            imagePickerController.sourceType = .photoLibrary
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        self.present(actionSheet, animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeTextField: UITextField!
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        createTimePicker()
        createDirectory()
        
        // Do any additional setup after loading the view.
    }

    
    func createDatePicker() {
      
        //format for picker
        datePicker.datePickerMode = .date
        
        //toolbar
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button 
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        
        dateTextField.inputView = datePicker
        
    }
    
    func donePressed(){
        //format date
        
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = .none
        
        
        dateTextField.text = dateFormat.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createTimePicker(){
        
        //format for picker
        timePicker.datePickerMode = .time
        
        //toolbar
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(timeDonePressed))
        toolbar.setItems([doneButton], animated: false)
        
        timeTextField.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        
        timeTextField.inputView = timePicker
        
    }
    
    func timeDonePressed(){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .none
        dateFormat.timeStyle = .medium
        
        
        timeTextField.text = dateFormat.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView.image = image
        
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("apple.png")
            if let pngImageData = UIImagePNGRepresentation(image) {
                try pngImageData.write(to: fileURL, options: .atomic)
                print("writing the image into the directory")
            }
        } catch { }
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent("apple.png").path
        if FileManager.default.fileExists(atPath: filePath) {
            print("printing the image path")
            print((contentsOfFile: filePath))
            
        }
        
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        UserDefaults.standard.set(imageStr,forKey:"imageBase64");
        print("printing base 64 image")
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func submitPost(_ sender: Any) {
        
//        let category = UserDefaults.standard.string(forKey: "category");
//        let title = "Test Title";
//        let city = UserDefaults.standard.string(forKey: "city");
//        let streetAddress = UserDefaults.standard.string(forKey: "streetAddress");
//        let description = UserDefaults.standard.string(forKey: "description");
//        let state = UserDefaults.standard.string(forKey: "state");
//        let zipcode = zipCodeTextField.text
//        let date = dateTextField.text
//        let time = timeTextField.text
//        let price = priceTextField.text
//        let ticketLink = ticketLinkTextField.text
//        let imageConverted = UserDefaults.standard.string(forKey: "imageBase64")
        
        let category = 1;
        let title = "Test Title";
        let city = "Test City";
        let streetAddress = "Test Address";
        let description = "Test City";
        let state = "PA";
        let zipcode = 16803
        let date = "2017-02-02"
        let time = "11:11:11"
        let price = 4
        let ticketLink = "https:www.test.com"
        let imageConverted = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAFhAJ/wlseKgAAAABJRU5ErkJggg=="
        let authorization = "Token a9edb73eb1ecfa66b87037cbfeada07406749f96"
        
       // let myUrl = URL(string: "http://www.wpoppin.com/api/events/");
        
        //var request = URLRequest(url:myUrl!)
        
       // request.httpMethod = "POST"// Compose a query string
        
      //  let postString = "category=\(category!)&title=\(title!)&city=\(city!)&streetAddress=\(streetAddress!)&description=\(description)&state=\(state!)&zipcode=\(zipcode!)&date=\(date!)&time=\(time!)&price=\(price!)&ticketLink=\(ticketLink!)&image=\(imageConverted!)";
       
       // let postString = "Authorization=\(authorization)&category=\(category)&title=\(title)&city=\(city)&streetAddress=\(streetAddress)&description=\(description)&state=\(state)&zipcode=\(zipcode)&date=\(date)&time=\(time)&price=\(price)&ticketLink=\(ticketLink)&image=\(imageConverted)";

        
     //   request.httpBody = postString.data(using: String.Encoding.utf8);
        
       
    let json: [String: Any] = ["Category": (category),"title":(title),"city":(city),"street_address":(streetAddress),"description":(description),"state":(state),"zip_code":(zipcode),"date":(date),"time":(time),"price":(price),"ticketLink":(ticketLink),"image":(imageConverted)]
     
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
       // create post request
        let url = URL(string: "http://www.wpoppin.com/api/events/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Token a9edb73eb1ecfa66b87037cbfeada07406749f96", forHTTPHeaderField: "Authorization")
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
               print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
        
                   print("submitting the event")
        
    }
    

}
