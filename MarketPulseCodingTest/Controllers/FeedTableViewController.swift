//
//  FeedTableViewController.swift
//  MarketPulseCodingTest
//
//  Created by Ganesh Prasad on 22/12/19.
//  Copyright © 2019 MarketPulse. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    //MARk: Properties
    var feeds = [FeedResponse]()
    let cellId = "FeedTVCellId"
    
    var tableViewRefreshControl: UIRefreshControl? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRefreshControllers()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFeed()
    }
    
    private func loadFeed() {
        
        
        ApiClent.shared.request { [weak self](result) in
            
            DispatchQueue.main.async {
                
                self?.tableViewRefreshControl?.endRefreshing()
                
                switch result {
                case .success(let feedResponse):
                    self?.feeds = feedResponse
                    print(feedResponse)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    func setUpRefreshControllers() {
        tableViewRefreshControl = UIRefreshControl()
        tableViewRefreshControl?.addTarget(self, action: #selector(handleRefreshControl(tableViewRefreshControl:)), for: UIControl.Event.valueChanged)
        self.tableView.addSubview(tableViewRefreshControl ?? UIRefreshControl())
        
    }
    
    
    @objc func handleRefreshControl(tableViewRefreshControl: UIRefreshControl)
    {
        loadFeed()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId,
            for: indexPath) as? FeedTVCell
            else {return UITableViewCell()}
        let feed = feeds[indexPath.item]
        cell.titleLB.text = feed.name
        cell.descLB.text = feed.tag
        
        if let color = feed.color {
            switch color {
            case "green":
                cell.descLB.textColor = .green
                break
            case "red":
                cell.descLB.textColor = .red
                break
            case "blue":
                cell.descLB.textColor = .blue
                break
            default:
                cell.descLB.textColor = .purple
                break
            }
            
            
        }
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let feedDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedDetailViewController") as? FeedDetailViewController else {return}
        
        feedDetailVC.selectedFeed = feeds[indexPath.item]
        navigationController?.pushViewController(feedDetailVC, animated: true)
    }

}
