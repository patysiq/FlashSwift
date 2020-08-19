//
//  TipsViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 16/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    
    @IBOutlet weak var titleTip: UILabel!
    @IBOutlet weak var tipText: UILabel!
    
    var selectedTips: String = ""
    var selectedTipsTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // Clear the fields
          titleTip.text = ""
          tipText.text = ""
        
        // Set the title
        titleTip.text = selectedTipsTitle
        
        // Set the description
        tipText.text = selectedTips
    }
}
