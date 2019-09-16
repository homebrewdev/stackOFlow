//
//  TableViewCell.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 03/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
   // @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = backgroundColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
