//
//  UsersTable.swift
//  WebServiceIntegration
//
//  Created by Piyush on 28/11/2017 Saka.
//  Copyright © 1939 Piyush. All rights reserved.
//

import UIKit

class UsersTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var datSourceArray =  [user](){
        didSet{
            reloadData();
        }
    }

    override init(frame: CGRect, style: UITableViewStyle){
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
        
        self.delegate = self;
        self.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datSourceArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:userCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! userCell
        
        let myUser = self.datSourceArray[indexPath.row];
        
        cell.lblName.text = myUser.name;
        cell.lblUserName.text = myUser.userName;
        cell.lblEmail.text = myUser.email;
        cell.lblPhone.text = myUser.phone;
        cell.lblCompanyName.text = myUser.company.companyName;
        cell.lblCompanyPhrase.text = myUser.company.phrase;
        cell.lblAddress.text = myUser.address.street;
        
        return cell;
    }

}
