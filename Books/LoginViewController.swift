//
//  LoginViewController.swift
//  Books
//
//  Created by SDS-019 on 2017. 4. 27..
//  Copyright © 2017년 SDS-019. All rights reserved.
//

import UIKit

protocol LoginProtocol {
    func completedLogin(name:String)
    
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    
    var delegate:LoginProtocol? = nil
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func confirm(_ sender: Any) {
        
        
        if let names:String = nameTextField.text{
            openAlert(name: names)
        }
        
        
        
        //self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openAlert(name:String){
        let alert = UIAlertController(title: "Welcom", message: "Welcom \(name)", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default){
            (UIAlertAction)->() in
            self.delegate?.completedLogin(name: name)
            self.dismiss(animated: true, completion: nil)
        }
        
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
                self.dismiss(animated: true, completion: nil)
            })
            
        }
        
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
