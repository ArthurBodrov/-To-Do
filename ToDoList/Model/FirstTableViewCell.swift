//
//  FirstTableViewCell.swift
//  ToDoList
//
//  Created by Arthur on 07.03.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellTextLabel: UILabel!
    
    @IBOutlet weak var checkboxImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
