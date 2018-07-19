//
//  Navigation.swift
//  Lottery
//
//  Created by iMac on 16.06.2018.
//  Copyright © 2018 DEVELOPER. All rights reserved.
//

import UIKit

class Navigation: NSObject {

    //MARK: - Present
    
    static func present(from: UIViewController, to: UIViewController) {
        DispatchQueue.main.async { [weak from] () -> Void in
            
            guard let strongVC = from else { return }
            strongVC.present(to, animated: true, completion: nil)
        }
    }
    
    static func dismiss(from: UIViewController) {
        DispatchQueue.main.async { [weak from] () -> Void in
            
            guard let strongVC = from else { return }
            strongVC.dismiss(animated: true, completion: nil)
        }
    }
    static func push(from: UIViewController, to: UIViewController) {
        DispatchQueue.main.async { [weak from] () -> Void in
            
            guard let strongVC = from else { return }
            strongVC.navigationController?.pushViewController(to, animated: true)
        }
    }
    
    static func popToRoot(from: UIViewController) {
        DispatchQueue.main.async { [weak from] () -> Void in
            
            guard let strongVC = from else { return }
            strongVC.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    static func pop(from: UIViewController) {
        DispatchQueue.main.async { [weak from] () -> Void in
            
            guard let strongVC = from else { return }
            strongVC.navigationController?.popViewController(animated: true)
        }
    }
}
