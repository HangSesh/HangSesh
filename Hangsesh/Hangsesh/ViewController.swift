//
//  ViewController.swift
//  app
//
//  Created by Abhijeet Malamkar on 2/5/17.
//  Copyright © 2017 Abhijeet Malamkar. All rights reserved.
//

import UIKit
import Lottie


struct postSruct {
    var name:String!
    var peopleCount:String!
    var distace:String!
}

var heightOfHeader:CGFloat = 44

class TableViewController: UITableViewController {
    
    
    //custom animation button declaration
    var menuOn = true
    var hamburggerMenuButton:LAAnimationView?
    var hamburggerMenuFrame = CGRect(x: 0, y: 10, width: 75, height: 75)
    
    var arrayOfPosts = [postSruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        f()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayOfPosts = [postSruct.init(name: "Abhijeet",peopleCount: "10",distace: "10 miles"),postSruct.init(name: "aaaa",peopleCount: "1",distace: "1 miles"),postSruct.init(name: "Abhijeet",peopleCount: "10",distace: "19 miles")]
        
        addHamburggerMenuButton(on: menuOn)
    }
    
    func addHamburggerMenuButton(on:Bool)
    {
        //checking the button is already there if yes delete it and set it to nil
      if hamburggerMenuButton != nil
      {
        hamburggerMenuButton?.removeFromSuperview()
        hamburggerMenuButton = nil
        }
        
        //get a condition to check whether its on or off
        let animation = on ? "data" : "buttonOn"
        
        hamburggerMenuButton = LAAnimationView.animationNamed(animation)
        hamburggerMenuButton?.isUserInteractionEnabled = true
        hamburggerMenuButton?.frame = hamburggerMenuFrame
        hamburggerMenuButton?.contentMode = .scaleAspectFill
        
        addMenuToggleRecognizer()
        
        
        self.view.addSubview(hamburggerMenuButton!)
        
    }
    
    func addMenuToggleRecognizer(){
    
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(TableViewController.toggleMenu))
        tapRecognizer.numberOfTapsRequired = 1
        hamburggerMenuButton?.addGestureRecognizer(tapRecognizer)
    }
    
    func toggleMenu(){
    
        if !menuOn{
            hamburggerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = true
                self.addHamburggerMenuButton(on: self.menuOn)
            })
        }
        else
        {
            hamburggerMenuButton?.play(completion: { (success:Bool) in
            self.menuOn = false
            self.addHamburggerMenuButton(on: self.menuOn)

            })
        }
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
        
        headerView.distance.text = arrayOfPosts[section].distace
        
        headerView.peopleCount.text = arrayOfPosts[section].peopleCount
        
        return headerView
    }
    
    @IBAction func buttonAnimation(_ sender: Any) {
        
        let animationView = LAAnimationView.animationNamed("data")
        animationView?.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
        animationView?.contentMode = .scaleAspectFill

        self.view.addSubview(animationView!)
        animationView?.play()
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

