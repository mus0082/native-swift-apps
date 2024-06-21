//
//  ViewController.swift
//  SearchFilterApp
//
//  Created by Muhammed Siddiqui on 2024-06-17.
//

//MARK: Imports
import UIKit

//MARK: Parent class
class ViewController: UIViewController {
    
    //MARK: VARIABLES AND ARRAYS
    var data: [String] = ["Apple","Banana","Orange","Pineapple","Strawberry","Watermelon"]
    var filteredData: [String] = []
    var forMessageStore: String = "Can not be able to find on the list"
    
    //MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Override method to load on screen
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filteredData = data
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}


//MARK: CONFORMS DELEGATES AND DATASOURCE
extension ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    //MARK: Method SEARCHBAR TEXT
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredData = data
        }else {
            filteredData = data.filter {$0.localizedCaseInsensitiveContains(searchText)}
        }
        if filteredData.isEmpty{
            filteredData = [forMessageStore]
        }
        tableView.reloadData()
    }
    
    //MARK: ROWS COUNT
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    //MARK: DISPLAY CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let storeValue = filteredData[indexPath.row]
        
        tableViewCell.textLabel?.text = storeValue
        
        if storeValue.isEmpty {
            tableViewCell.textLabel?.text = forMessageStore
        }else {
            tableViewCell.textLabel?.text = storeValue
        }
        return tableViewCell
    }
}

