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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
