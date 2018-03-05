//
//  user.swift
//  WebServiceIntegration
//
//  Created by Piyush on 28/11/2017 Saka.
//  Copyright © 1939 Piyush. All rights reserved.
//

import Foundation
import SwiftyJSON

class user{
    var name: String
    var userName: String
    var email: String
    var phone: String
    var address = userAddress(addressJSON: JSON.null);
    var company = userCompany(companyJSON: JSON.null);
    
    init(userJSON: JSON) {
        self.name = userJSON["name"].stringValue;
        self.userName = userJSON["username"].stringValue;
        self.email = userJSON["email"].stringValue;
        self.phone = userJSON["phone"].stringValue;
        
        self.address = userAddress(addressJSON:userJSON["adress"]);
        self.company = userCompany(companyJSON:userJSON["company"]);
    }
}

class userAddress{
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    
    init(addressJSON: JSON) {
        self.street = addressJSON["street"].stringValue;
        self.suite = addressJSON["suite"].stringValue;
        self.city = addressJSON["city"].stringValue;
    }
}

class userCompany{
    var companyName: String = ""
    var phrase: String = ""
    
    init(companyJSON: JSON) {
        self.companyName = companyJSON["name"].stringValue;
        self.phrase = companyJSON["catchPhrase"].stringValue;
    }
}

