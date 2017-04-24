import UIKit


class ComedyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = -1
    var events: [Event]?
    
    
    func fetchData(){
       // let url = URL(string: "http://www.wpoppin.com/api/comedy.json")
        
        let defaults = UserDefaults.standard
        let mylink = defaults.integer(forKey: "mylink")
        print("printing my link")
        print(mylink)
        var url = URL(string: "http://www.wpoppin.com/api/art.json")
        if (mylink == 1)
        {
            url = URL(string: "http://www.wpoppin.com/api/music.json")
            print("inside music")
        }
        else if (mylink == 2)
        {   print("inside 2")
            url = URL(string: "http://www.wpoppin.com/api/performing_arts.json")
        }
        else if (mylink == 3)
        {    print("inside 3")
             url = URL(string: "http://www.wpoppin.com/api/art.json")
        }
        else if (mylink == 4)
        {    print("inside 4")
             url = URL(string: "http://www.wpoppin.com/api/comedy.json")
        }
        else if (mylink == 5)
        {    print("inside 5")
             url = URL(string: "http://www.wpoppin.com/api/poetry.json")
        }
        else if (mylink == 6)
        {    print("inside 6")
             url = URL(string: "http://www.wpoppin.com/api/charity.json")
        }

        print(url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                self.events = [Event]()
                for dictionary in json as! [[String: AnyObject]]{
                    let event = Event()
                    event.titleLabel = dictionary["title"] as? String
                    event.descLabel = dictionary["description"] as? String
                    event.authorLabel = dictionary["author"] as? String
                    event.addressLabel = dictionary["street_address"] as? String
                    event.cityLabel = dictionary["city"] as? String
                    event.dateLabel = dictionary["date"] as? String
                    event.timeLabel = dictionary["time"] as? String
                    event.priceLabel = String(dictionary["price"]! as! Int)
                    event.stateLabel = dictionary["state"] as? String
                     event.thumbnailImageView = dictionary["image"] as? String
                    self.events?.append(event)
                    
                    event.thumbnailImageView = event.thumbnailImageView?.replacingOccurrences(of: ".jpg", with: ".large.jpg")
                    
                    event.descLabel = "By " + event.authorLabel! + ": " + event.descLabel!
                    if (event.priceLabel == "0"){
                        event.priceLabel = "Free"
                    }
                    else {
                        event.priceLabel = "$" + event.priceLabel!
                    }
                    
                    
                    
                    let test = event.dateLabel
                    // create dateFormatter
                    let dateFormatter = DateFormatter()
                    //initially Set your Dateformat which one you get from Server
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    // convert your String to Date
                    dateFormatter.locale = Locale.init(identifier: "en_GB")
                    let date = dateFormatter.date(from: test!)
                    
                    
                    // again change the format in which type the output you need
                    dateFormatter.dateFormat = "  EE'\n'MMM d"
                    // finaly you get the output in here
                    let finalOutput = dateFormatter.string(from: date!)
                    event.dateLabel = finalOutput
                    
                    
                    
                    let timeString = event.timeLabel
                    let timeFormatter = DateFormatter()
                    timeFormatter.dateFormat = "HH:mm:ss"
                    timeFormatter.locale = Locale.init(identifier: "en_GB")
                    
                    let time = timeFormatter.date(from: timeString!)
                    
                    timeFormatter.dateFormat = "h:mm aa"
                    let finalTime = timeFormatter.string(from: time!)
                    event.timeLabel = finalTime

                    
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView?.reloadData()
                })
            } catch let jsonError{
                print(jsonError)
            }
            
            
            
        }).resume()
        
    }
    
    @IBAction func AddEvent(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "calshow://")! as URL)

    }
   
    @IBAction func share(_ sender: Any) {
        
        let link = NSURL(string: "http://wpoppin.com")
        let vc = UIActivityViewController(activityItems: ["http://wpoppin.com",link!], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(TodayEventsViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        print("fetching from did load")
        
    }
    
    func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }}

extension ComedyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexpath) as! ComedyTableView
        let Event = events![indexpath.row]
        cell.configure(Event)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (selectedIndex == indexPath.row){
            tableView.estimatedRowHeight = 150
            tableView.rowHeight = UITableViewAutomaticDimension
            return UITableViewAutomaticDimension;
        }else{
            return 350;
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(selectedIndex == indexPath.row){
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
        }
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        self.tableView.endUpdates()
    }

    
}
