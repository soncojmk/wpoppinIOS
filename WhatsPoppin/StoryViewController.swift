import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = -1
    var events: [Event]?
    
    
    func fetchData(){
        let url = URL(string: "http://www.wpoppin.com/api/blog.json")
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
                     event.thumbnailImageView = dictionary["image"] as? String
                    event.thumbnailImageView = event.thumbnailImageView?.replacingOccurrences(of: ".jpg", with: ".large.jpg")
                    event.authorLabel = "By " + event.authorLabel! + ": "
                    self.events?.append(event)
                    
                }
                DispatchQueue.main.async(execute: {
                    self.tableView?.reloadData()
                })
            } catch let jsonError{
                print(jsonError)
            }
            
            
            
        }).resume()
        
    }
    
    @IBAction func share(_ sender: Any) {
        let link = NSURL(string: "http://wpoppin.com")
        let vc = UIActivityViewController(activityItems: ["http://wpoppin.com",link!], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
       
         self.navigationController?.navigationBar.topItem?.title = "What'sPoppin Stories";
        
    }
}

extension StoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexpath) as! StoryTableView
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
