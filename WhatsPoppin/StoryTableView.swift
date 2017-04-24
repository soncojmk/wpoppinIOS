//
//  HomeTableViewCell.swift
//  tabber_What'sPoppin
//
//  Created by ISHAN ATUL RANPURA on 12/10/16.
//  Copyright © 2016 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class StoryTableView: UITableViewCell {
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
   @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    
    func configure(_ event: Event){
        titleLabel.text = event.titleLabel
        descLabel.text = event.descLabel
            descLabel.numberOfLines = 0;
        [descLabel, sizeToFit] as [Any];
        authorLabel.text = event.authorLabel
        if let thumbnailImageUrl = event.thumbnailImageView{
            let url = NSURL(string: thumbnailImageUrl)
            URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error)
                    return
                }
                DispatchQueue.main.async(execute: {
                    self.thumbnailImageView.image = UIImage(data: data!)
                })
            }).resume()
        }
           }
}
