//
//  HomeTableViewCell.swift
//  tabber_What'sPoppin
//
//  Created by ISHAN ATUL RANPURA on 12/10/16.
//  Copyright © 2016 ISHAN ATUL RANPURA. All rights reserved.
//

import UIKit

class TodayEventsTableViewCell: UITableViewCell {
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    func configure(_ event: Event){
        titleLabel.text = event.titleLabel
        descLabel.text = event.descLabel
        priceLabel.text = event.priceLabel
        addressLabel.text = event.addressLabel
        dateLabel.text = event.dateLabel
        timeLabel.text = event.timeLabel
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
