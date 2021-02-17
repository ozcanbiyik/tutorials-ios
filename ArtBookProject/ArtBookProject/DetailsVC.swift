//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Özcan BIYIK on 7.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var artistTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if chosenPainting != ""{
            
            saveButton.isHidden = true
            
            //Core Data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameTF.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String {
                            artistTF.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int {
                            yearTF.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data : imageData)
                            imageView.image = image
                        }
                    }
                }
                
            } catch  {
                print("Error")
            }
            
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
        
        
        //MARK: RECOGNIZER
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        //MARK: EZBER
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPaiting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // Attributes
        
        newPaiting.setValue(nameTF.text!, forKey: "name")
        newPaiting.setValue(artistTF.text!, forKey: "artist")
        
        if let year = Int(yearTF.text!){
            newPaiting.setValue(year, forKey: "year")
        }
        
        newPaiting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newPaiting.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("Success")
        } catch {
            print("Error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
