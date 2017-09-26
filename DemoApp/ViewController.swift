//
//  ViewController.swift
//  DemoApp
//  Created by Bhavin Mandaliya on 03/03/17.


import UIKit

class ViewController: UIViewController {


  @IBOutlet weak var refreshButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.refreshButton.rotate360Degrees()
      
        
        delay(2.0) {
            let ObjTablewDataVC =  Constants.mainStoryboard.instantiateViewController(withIdentifier: "TablewDataVC") as! TablewDataVC
            self.navigationController?.pushViewController(ObjTablewDataVC, animated: false)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


