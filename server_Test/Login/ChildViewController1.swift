//
//  ChildViewController1.swift
//  server_Test
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class ChildViewController1: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginTF.setBottomBorder()
        passwordTF.setBottomBorder()
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        let st = UIStoryboard.init(name: "Photos", bundle: nil)
        if let vc = st.instantiateViewController(withIdentifier: "PhotosViewController") as? PhotosViewController {
            Navigation.present(from: self, to: vc)
        }
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Login")
    }

}
