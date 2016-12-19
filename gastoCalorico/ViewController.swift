//
//  ViewController.swift
//  gastoCalorico
//
//  Created by Brunno Goncalves on 19/12/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var profile: Profile!
    
    @IBOutlet weak var stackViewIMC: UIStackView!
    @IBOutlet weak var nameField: niceField!
    @IBOutlet weak var ageField: niceField!
    @IBOutlet weak var weightField: niceField!
    @IBOutlet weak var heightField: niceField!
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var imcZoneLabel: UILabel!
    @IBOutlet weak var tmbLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.hideKeyboardWhenTappedAround()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapIMC))
        stackViewIMC.isUserInteractionEnabled = true
        stackViewIMC.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func tapIMC(){
        
        if let name = nameField.text, let age = ageField.text, let weight = weightField.text, let height = heightField.text{
            
            profile = Profile(name: name)
            if let ageInt = Int(age){
                profile.age = ageInt
            }
            if let weightDouble = Double(weight){
                profile.bodyWeight = weightDouble
            }
            if let heightDouble = Double(height){
                profile.heigth = heightDouble
            }
            
            imcLabel.text = "\(profile.imc)"
            imcZoneLabel.text = "\(profile.imcZone)"
            tmbLabel.text = "\(profile.tmb)"
            
        }
        
        print("BGONCALVES: Tapped")
    }

}

