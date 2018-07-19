//
//  ChildViewController2.swift
//  server_Test
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChildViewController2: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginTF.setBottomBorder()
        passwordTF.setBottomBorder()
        repPasswordTF.setBottomBorder()
        
    }
    @IBAction func registerPressed(_ sender: UIButton) {
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Registration")
    }
}
