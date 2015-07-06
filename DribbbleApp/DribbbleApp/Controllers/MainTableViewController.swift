//
//  MainTableViewController.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 30/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let dribbbleHTTPClient = DribbleHTTPClient()
    var shotsArray = Array<Shot>()
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    var backgroundView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colocar view background enquanto os dados são carregados

        self.dribbbleHTTPClient.getShots(loadShots)
    }

    func loadShots(shots: Array<Shot>) {
        self.shotsArray = shots
        self.tableView.reloadData()
        println("LoadShots foi executado")
        
    }
    
    // MARK: TableView Data
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shotsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = Reusable.Cell.identifier!
        let cell = self.tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
        
        let shot = self.shotsArray[indexPath.row]
        
        cell.textLabel?.text = shot.title
        cell.detailTextLabel?.text = shot.userName
        
        return cell
    }

}