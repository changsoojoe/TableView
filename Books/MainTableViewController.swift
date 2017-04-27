//
//  MainTableViewController.swift
//  Books
//
//  Created by SDS-019 on 2017. 4. 27..
//  Copyright © 2017년 SDS-019. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, LoginProtocol {

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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func completedLogin(name: String) {
        print(name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView \(indexPath)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "Hello world. \(indexPath)"
        cell.detailTextLabel?.text = "I want to go home"
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

}
