//
//  ViewController.swift
//  F_Search
//
//  Created by apple on 2/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    
     var searchArr = ["Home","Profile", "City", "Man", "Weman","F","A"]

    @IBOutlet weak var Searchbar: UISearchBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    var searching = false
    var mysearch = [String]()
    var searchTitle = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Searchbar.delegate = self
        // Do any additional setup after loading the view.
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
        return mysearch.count
        
    } else {
        return searchArr.count
    }
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "search")
                      
                      if searching{
                          cell?.textLabel?.text = mysearch[indexPath.row]
                      } else{
                          cell?.textLabel?.text = searchArr[indexPath.row]
                      }
                      return cell!
                      
                  }
    //MARK: Serach Bar
  
}

 extension ViewController: UISearchBarDelegate{
    private func searchbar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
 
            mysearch = searchArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            
            searching = true
        self.TableView.reloadData()
 
    }
    
    //MARK: Cancel Button
    
    private func SearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
               searching = false
               searchBar.text = ""
               TableView.reloadData()
               
    }
}
