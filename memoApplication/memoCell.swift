//
//  TableViewCell.swift
//  memoApplication
//
//  Created by 이진하 on 2020/04/01.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

class memoCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

