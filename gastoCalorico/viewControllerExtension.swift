//
//  viewControllerExtension.swift
//  gastoCalorico
//
//  Created by Brunno Goncalves on 19/12/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
