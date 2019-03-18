//
//  ViewController.swift
//  RealM Demo
//
//  Created by Madhav's Mac on 12/03/19.
//  Copyright © 2019 Madhav. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var dataTableView: UITableView!
    var arrData:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        arrData.add([
            "name":"Madhav",
            "address":"Mumbai"
            ])
        arrData.add([
            "name":"Mahesh",
            "address":"Pune"
            ])
        arrData.add([
            "name":"Kiran",
            "address":"Goa"
            ])
    }

    @IBAction func addAction(_ sender: Any) {
        print("add action")
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController.init(title: "Add User", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name"
            textField.tag = 1
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Address"
            textField.tag = 2
        }
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel Action")
        }))
        
        alert.addAction(UIAlertAction.init(title: "Add", style: .default, handler: { (action) in
            print("Add Action")
            let textFieldName = alert.textFields![0]
            let strName = textFieldName.text as! String
            print("Entered Name - \(strName)")
            
            let textFieldAddress = alert.textFields![1]
            let strAddress = textFieldAddress.text as! String
            print("Entered Address - \(strAddress)")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK- TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath as IndexPath)
        
        let dic:NSDictionary = arrData.object(at: indexPath.row) as! NSDictionary
        print("Dictionry Data : \(dic)")
        
        let lblTitle:UILabel = cell.viewWithTag(1) as! UILabel
        lblTitle.text = "Name : \(dic.value(forKey: "name") as! String)"
        
        let lblSubTitle:UILabel = cell.viewWithTag(2) as! UILabel
        lblSubTitle.text = "From - \(dic.value(forKey: "address") as! String)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Index \(indexPath.row)")
    }
    
}

