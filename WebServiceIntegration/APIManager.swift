//
//  APIManager.swift
//  WebServiceIntegration
//
//  Created by Piyush on 28/11/2017 Saka.
//  Copyright © 1939 Piyush. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class APIMamager{
    
    static let sharedInstance = APIMamager();
    
    private init(){
        
    }
    
    func getUserFromUrl(onCompletion: @escaping (JSON) -> Void){
        
        let url = URL(string: USERS_URL);
        var req = URLRequest(url: url! as URL);
        req.httpMethod = "GET";
        req.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        Alamofire.request(req).responseJSON(){ response in
            
            switch response.result{
                
            case .success(let data):
                let tempResponse = JSON(data);
                onCompletion(tempResponse);
                print("Success", tempResponse);
            case .failure(let error):
                onCompletion(JSON.null);
                print("Failure", error);
            }
        }
    }
}
