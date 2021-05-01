//
//  FeedViewController.swift
//  Prototype
//
//  Created by Arifin Firdaus on 01/05/21.
//

import UIKit

struct FeedImageViewModel {
     let description: String?
     let location: String?
     let imageName: String
 }

class FeedViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        return cell
    }
    
}
