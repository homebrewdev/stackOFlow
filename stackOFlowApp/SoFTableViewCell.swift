//
//  SoFTableViewCell.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 18/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class SoFTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        print("cell selected ...")
    }
    
}
