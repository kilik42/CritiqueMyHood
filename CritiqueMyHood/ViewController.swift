//
//  ViewController.swift
//  CritiqueMyHood
//
//  Created by marvin evins on 5/8/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //set dummy data
//        let post = Post(imagePath: " ", title: "Post 1", description: "post 1 description")
//        
//        let post2 = Post(imagePath: "", title: "post 2", description: "this is a second post of no significance")
//        let post3 = Post(imagePath: "", title: "Post 3", description: "this the thrist most importan description")
//        
//        
//        posts.append(post)
//        posts.append(post2)
//        posts.append(post3)
//        
//        
//        tableView.reloadData()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
        
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post =  DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{
            
            cell.configureCell(post)
            return cell
            
        }else {
            var cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  DataService.instance.loadedPosts.count
    }

    func onPostsLoaded(notif: AnyObject){
        
        tableView.reloadData()
    }
    
}

