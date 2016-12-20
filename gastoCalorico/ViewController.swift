//
//  ViewController.swift
//  gastoCalorico
//
//  Created by Brunno Goncalves on 19/12/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var profile: UserProfile!
    
    let nivelAtividade: [String] = ["Baixo","Moderado","Alto","Muito Alto"]
    
    @IBOutlet weak var stackViewIMC: UIStackView!
    @IBOutlet weak var nameField: niceField!
    @IBOutlet weak var ageField: niceField!
    @IBOutlet weak var weightField: niceField!
    @IBOutlet weak var heightField: niceField!
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var imcZoneLabel: UILabel!
    @IBOutlet weak var tmbLabel: UILabel!
    @IBOutlet weak var nivelAtividadePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.hideKeyboardWhenTappedAround()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapIMC))
        stackViewIMC.isUserInteractionEnabled = true
        stackViewIMC.addGestureRecognizer(tapGestureRecognizer)
        
        nivelAtividadePicker.delegate = self
        nivelAtividadePicker.dataSource = self
        
        getProfile()
        
    }
    
    func tapIMC(){
        
        if let name = nameField.text, let age = ageField.text, let weight = weightField.text, let height = heightField.text{
            
            profile = UserProfile(name: name)
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
        storeProfile()
        
        print("BGONCALVES: Tapped")
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storeProfile () {
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Profile", in: context)
        
        let profileObject = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        profileObject.setValue(profile.name, forKey: "name")
        profileObject.setValue(profile.age, forKey: "age")
        profileObject.setValue(profile.bodyWeight, forKey: "weight")
        profileObject.setValue(profile.heigth, forKey: "height")
        
        //save the object
        do {
            try context.save()
            print("BGONCALVES: saved!")
        } catch let error as NSError  {
            print("BGONCALVES: Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func getProfile () {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for profileFetched in searchResults {
                //get the Key Value pairs (although there may be a better way to do that...
                profile = UserProfile(name: profileFetched.name!)
                profile.age = Int(profileFetched.age)
                profile.bodyWeight = profileFetched.weight
                profile.heigth = profileFetched.height
                
                nameField.text = profile.name
                ageField.text = "\(profile.age)"
                heightField.text = "\(profile.heigth)"
                weightField.text = "\(profile.bodyWeight)"
                imcLabel.text = "\(profile.imc)"
                imcZoneLabel.text = profile.imcZone
                tmbLabel.text = "\(profile.tmb)"
                
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return nivelAtividade.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return nivelAtividade[row]
        
    }

}

