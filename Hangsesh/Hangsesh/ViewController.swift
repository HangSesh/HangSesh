//
//  ViewController.swift
//  app
//
//  Created by Abhijeet Malamkar on 2/5/17.
//  Copyright © 2017 Abhijeet Malamkar. All rights reserved.
//

import UIKit

struct postSruct {
    var name:String!
}

var heightOfHeader:CGFloat = 44

class TableViewController: UITableViewController {
    
    var arrayOfPosts = [postSruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        f()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayOfPosts = [postSruct.init(name: "Abhijeet"),postSruct.init(name: "Abhijeet"),postSruct.init(name: "Abhijeet"),postSruct.init(name: "Abhijeet")]
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfPosts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightOfHeader
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        
        headerView.HeaderLabel.text = arrayOfPosts[section].name
        
        return headerView
    }
    
    func f()
    {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://api.topcoder.com/v2/develop/challenges?pageSize=2")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                        
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

