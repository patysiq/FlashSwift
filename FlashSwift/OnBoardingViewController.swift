//
//  OnBoardingViewController.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 21/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var destinationViewController = segue.destination
    if let navigationController = destinationViewController as? UINavigationController {
        destinationViewController = navigationController.visibleViewController ?? destinationViewController
    }
    }
    
    @IBAction func buttonOnBording(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: Cte.OnbordingSegue, sender: self)

    }
    
}
