//
//  WebViewVC.swift
//  DemoApp
//
//  Created by vaidehi on 22/09/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

        var strDataUrlSend = String()
    
        @IBOutlet weak var webView_dabs: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let url = NSURL (string: ("https://www.google.co.in/search?q=" + strDataUrlSend).replacingOccurrences(of: " ", with: "%20"))
        let requestObj = URLRequest(url: url! as URL)
        webView_dabs.loadRequest(requestObj)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }

}
