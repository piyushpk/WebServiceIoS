//
//  ViewController.swift
//  WebServiceIntegration
//
//  Created by Piyush on 28/11/2017 Saka.
//  Copyright © 1939 Piyush. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var myResponse: JSON = JSON.null;
    var users:[user] = [];
    
    @IBOutlet weak var myTable: UsersTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getUserData(){
        APIMamager.sharedInstance.getUserFromUrl(){(userJson) -> Void in
            if userJson != JSON.null{
                
                self.myResponse = userJson;
                
                for i in 0..<self.myResponse.count{
                    let singleUser = user(userJSON: self.myResponse[i]);
                    self.users.append(singleUser);
                }
                
                self.myTable.datSourceArray = self.users;
//                self.self.myTable.reloadData();
            }
        };
    }
}

