//
//  ViewController.swift
//  ToDoList-sqlite(Work)
//
//  Created by Hakan Hardal on 13.03.2024.
//

import UIKit
import RxSwift

class MainView: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = [Entity]()
    var mainVM = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    
        _ = mainVM.planList.subscribe(onNext: { list in
            self.list = list
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainVM.planUpload()
    }
}

extension MainView : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! ToDoTableViewCell
        cell.planLabel.text = list[indexPath.row].plan_name
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC"{
            if let plan = sender as? Entity{
                let destination = segue.destination as! DetailView
                destination.plan = plan
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = list[indexPath.row]
        performSegue(withIdentifier: "detailVC", sender: data)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAct = UIContextualAction(style: .destructive, title: "Delete") { uicontextualaction, view, bool in
          
            let plan = self.list[indexPath.row]
            let alert = UIAlertController(title: "Delete To Do", message: "Are you sure to delete?", preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in
                self.mainVM.deletePlan(plan_id: plan.plan_id!)
            }
            alert.addAction(deleteAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAct])
    }
}



extension MainView : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainVM.searchBar(searchText: searchText)
    }
}

