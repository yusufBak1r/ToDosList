//
//  SaveScreen.swift
//  ToDosApp
//
//  Created by yusuf bakır on 25.05.2024.
//

import UIKit
//

class SaveScreen: UIViewController {
   
    @IBOutlet weak var textfiledName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Save Screen"
        
    }
    

    
    @IBAction func saveTapped(_ sender: Any) {
        
       
        if let name = textfiledName.text {
          save(name: name)
        }
//        
    }
    func save(name : String ){
        print("To Do save :\(name)")
        
    }
}
