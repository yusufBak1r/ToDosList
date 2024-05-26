//
//  UpdateScreen.swift
//  ToDosApp
//
//  Created by yusuf bakır on 25.05.2024.
//

import UIKit

class UpdateScreen: UIViewController {
    var ToDos :ToDosEntity?
    

    @IBOutlet weak var updateNameTextfiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Update Screen"
    
        if let t = ToDos {
            updateNameTextfiled.text = t.name
        }
        
    }
    



    @IBAction func updateTapped(_ sender: Any) {
        if let t = ToDos,let name = updateNameTextfiled.text {
            update(id: t.id!, name: name)
        }
        
    }
    func update(id:Int,name:String ){
        print("Todo update \(id)-\(name)")
    }
}
