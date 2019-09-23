//
//  JSONViewController.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 16/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class JSONViewController : UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // по нажатию на кнопку  back
    @IBAction func backBtnTap(_ sender: UIButton) {
        performSegue(withIdentifier: "backToTableVC", sender: UIBarButtonItem.self)
    }
}
