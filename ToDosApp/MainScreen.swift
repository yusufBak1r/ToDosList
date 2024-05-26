//
//  ViewController.swift
//  ToDosApp
//
//  Created by yusuf bakır on 25.05.2024.
//

import UIKit

class MainScreen: UIViewController {
    var delegate : ToDoCellProtocol?
      var toDoList = [ToDosEntity]()
     @IBOutlet weak var tableViewList: UITableView!
     @IBOutlet weak var searchBar: UISearchBar!
     override func viewDidLoad() {
        super.viewDidLoad()
         searchBar.delegate = self
         tableViewList.delegate = self
         tableViewList.dataSource = self
         
          navigationConfigre()
         loadToDos()
        
    }
    func loadToDos() {
        let toDos1 = ToDosEntity(id:1 ,name: "Spor yap")
        let toDos2 = ToDosEntity(id: 2,name:"Ödev")
        let toDos3 = ToDosEntity(id:3 ,name: "Alişveriş")
        toDoList.append(toDos1)
        toDoList.append(toDos2)
        toDoList.append(toDos3)
    }
    func navigationConfigre(){
//        self.navigationItem.titleView?.translatesAutoresizingMaskIntoConstraints  = false
        self.navigationItem.title = "To Dos"
        navigationController?.navigationBar.tintColor = UIColor(named: "AlternativeColor")
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor(named: "MainColor")
        appearence.titleTextAttributes = [.font:UIFont(name: "Pacifico-Regular", size: 22)!,.foregroundColor:UIColor(named: "AlternativeColor")!]
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
       
    }

    @IBAction func toUpadateTapped(_ sender: Any) {
        
        let toDo = ToDosEntity(id: 1,name: "Spor yap")
        
        performSegue(withIdentifier: "MainToUpdate", sender: toDo)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "MainToUpdate" {
            print("prepare çalıştı")
            if let toDo  = sender as? ToDosEntity {
                let destinationVC = segue.destination as! UpdateScreen
                destinationVC.ToDos = toDo
            }
            
        }
    }
    
}
// MARK: -- UISearchBar Protocol func 
extension MainScreen:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("ToDo Serach :\(searchText)")
    }
    
}

extension MainScreen :UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewList.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        cell.delegate  = self
        cell.indexPath = indexPath
        cell.titleName.text = toDoList[indexPath.item].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
         performSegue(withIdentifier: "MainToUpdate", sender: toDo)
        tableViewList.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction  = UIContextualAction(style: .destructive, title: "Delete" ) { contextualAction, view, bool in
            
                  let toDo = self.toDoList[indexPath.row]
                 
                  let alert = UIAlertController(title: "Delete Process", message: "Do you want to delete \(toDo.name!) ?", preferredStyle: .alert)
                  let cencelAlert = UIAlertAction(title: "Cencel", style: .cancel)
                  alert.addAction(cencelAlert)
                  let yesAction = UIAlertAction(title: "Yes", style: .destructive) {action in
                      print("ToDo Delete \(toDo.id!)")
                      
                  }
                  alert.addAction(yesAction)
                  self.present(alert,animated: true)
            
        }
     return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    
}
extension MainScreen : ToDoCellProtocol{
    func deleteClicked(indexPath: IndexPath) {
    
        
  
        let toDo = self.toDoList[indexPath.row]
       
        let alert = UIAlertController(title: "Delete Process", message: "Do you want to delete \(toDo.name!) ?", preferredStyle: .alert)
        let cencelAlert = UIAlertAction(title: "Cencel", style: .cancel)
        alert.addAction(cencelAlert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {action in
            print("ToDo Delete \(toDo.id!)")
            
        }
        alert.addAction(yesAction)
        self.present(alert,animated: true)
    
    }
    
    
}
