//
//  MainViewController.swift
//  EECellSwipeGestureRecognizerDemo
//
//  Created by Enric Enrich on 02/01/16.
//  Copyright © 2016 Enric Enrich. All rights reserved.
//

import UIKit
import EECellSwipeGestureRecognizer

class MainViewController: UITableViewController {

    // MARK: Properties
    
    fileprivate var rows = [UITableViewCell]()
    
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "EECellSwipeGestureRecognizer"
        self.view.backgroundColor = UIColor.white
        
        self.prepareDataArray()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 60
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.rows.count > 0 {
            return self.rows[indexPath.row]
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: Private API
    
    fileprivate func prepareDataArray() {
        self.rows = [self.rightPushSwipeCell, self.leftPullSwipeCell, self.rightAndLeftSwipeCell]
    }
    
    // MARK: Getters
    
    fileprivate lazy var rightPushSwipeCell: UITableViewCell = {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Right Push"
        
        let slideGestureRecognizer: EECellSwipeGestureRecognizer = EECellSwipeGestureRecognizer()
        
        let rightPushAction: EECellSwipeAction = EECellSwipeAction(fraction: 0.25)
        rightPushAction.icon = UIImage(named: "circle")!
        rightPushAction.activeBackgroundColor = UIColor.greenColor()
        rightPushAction.behavior = .Push
        rightPushAction.didTrigger = { (tableView, indexPath) in
            print("Right Push")
            
            let alert = UIAlertController(title: "Swiped", message: "Right Push", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                slideGestureRecognizer.swipeToOrigin(true, completion: nil)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        slideGestureRecognizer.addActions([rightPushAction])
        
        cell.addGestureRecognizer(slideGestureRecognizer)
        return cell
    }()
    
    fileprivate lazy var leftPullSwipeCell: UITableViewCell = {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Left Pull"
        
        let slideGestureRecognizer: EECellSwipeGestureRecognizer = EECellSwipeGestureRecognizer()
        
        let leftPullAction: EECellSwipeAction = EECellSwipeAction(fraction: -0.25)
        leftPullAction.icon = UIImage(named: "circle")!
        leftPullAction.activeBackgroundColor = UIColor.blueColor()
        leftPullAction.behavior = .Pull
        leftPullAction.didTrigger = { (tableView, indexPath) in
            print("Left Pull")
        }
        
        slideGestureRecognizer.addActions([leftPullAction])
        
        cell.addGestureRecognizer(slideGestureRecognizer)
        return cell
    }()
    
    fileprivate lazy var rightAndLeftSwipeCell: UITableViewCell = {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Right Push & Left Pull"
        
        let slideGestureRecognizer: EECellSwipeGestureRecognizer = EECellSwipeGestureRecognizer()
        
        let rightPushAction: EECellSwipeAction = EECellSwipeAction(fraction: 0.25)
        rightPushAction.icon = UIImage(named: "circle")!
        rightPushAction.activeBackgroundColor = UIColor.greenColor()
        rightPushAction.behavior = .Push
        rightPushAction.didTrigger = { (tableView, indexPath) in
            print("Right Push")
            
            let alert = UIAlertController(title: "Swiped", message: "Right Push", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                slideGestureRecognizer.swipeToOrigin(true, completion: nil)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let leftPullAction: EECellSwipeAction = EECellSwipeAction(fraction: -0.25)
        leftPullAction.icon = UIImage(named: "circle")!
        leftPullAction.activeBackgroundColor = UIColor.blueColor()
        leftPullAction.behavior = .Pull
        leftPullAction.didTrigger = { (tableView, indexPath) in
            print("Left Pull")
        }
        
        slideGestureRecognizer.addActions([rightPushAction, leftPullAction])
        
        cell.addGestureRecognizer(slideGestureRecognizer)
        return cell
    }()

}

