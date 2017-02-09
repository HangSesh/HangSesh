//
//  HeaderView.swift
//  app
//
//  Created by Abhijeet Malamkar on 2/8/17.
//  Copyright © 2017 Abhijeet Malamkar. All rights reserved.
//

import UIKit


class HeaderView: UITableViewCell {
    
    
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var peopleCount: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
