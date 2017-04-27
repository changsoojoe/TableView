//
//  ViewController.swift
//  Books
//
//  Created by SDS-019 on 2017. 4. 27..
//  Copyright © 2017년 SDS-019. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func openAlert(){
        let alert = UIAlertController(title: "Welcom", message: "Start Book App", preferredStyle: UIAlertControllerStyle.alert)
        
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

