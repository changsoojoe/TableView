//
//  MainTableViewController.swift
//  Books
//
//  Created by SDS-019 on 2017. 4. 27..
//  Copyright © 2017년 SDS-019. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, LoginProtocol {

//    var myArr:[[String:String]] = [[String:String]]()
    var loginName:String? = nil
    var appdelegate:AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    @IBAction func openLoginScene(_ sender: Any) {
        
        /*
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginview") as? LoginViewController{
            loginVC.delegate = self
            //present ==> modal
            self.present(loginVC, animated: true, completion: nil)
        }
        */
        
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginview") as? LoginViewController else{
            return
        }
        loginVC.delegate = self
        //present ==> modal
        self.present(loginVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addButtonClick(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        myArr.append("Hong")
        myArr.append("JOE")
        myArr.append("KIM")
        myArr.append("PARK")
 
        // Do any additional setup after loading the view.
        
        let dict1:[String:String] = ["name": "HONG", "phone":"010-4040-9292"]
        let dict2:[String:String] = ["name": "JOE", "phone":"010-2716-9992"]
        let dict3:[String:String] = ["name": "KIM", "phone":"010-9271-1726"]
        let dict4:[String:String] = ["name": "PARK", "phone":"010-7638-1766"]
        
        myArr.append(dict1)
        myArr.append(dict2)
        myArr.append(dict3)
        myArr.append(dict4)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func completedLogin(name: String) {
        print(name)
        //openAlert(name: name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        //return myArr.count
        if let books = appdelegate?.books{
            return books.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView \(indexPath)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        guard let books = appdelegate?.books else{
            print("guard return cell")
            return cell
        }
        
        cell.textLabel?.text = books[indexPath.row].title
        cell.detailTextLabel?.text = books[indexPath.row].author
        cell.imageView?.image = books[indexPath.row].coverImage
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func openAlert(name:String){
        let alert = UIAlertController(title: "Welcom", message: "Welcom \(name)", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: nil)
        
        /*
         let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
         (UIAlertAction)->() in
         self.view.backgroundColor = UIColor.red
         })
         */
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel){
            (UIAlertAction)->() in
            self.view.backgroundColor = UIColor.red
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true){
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {
                (Timer)->Void in
                alert.dismiss(animated: true, completion: nil)
            })
            
        }
        
    }

}
