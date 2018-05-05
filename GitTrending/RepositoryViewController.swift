//
//  RepositoryViewController.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 4..
//  Copyright © 2018년 swift. All rights reserved.
//

import UIKit
import WebKit
class RepositoryViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://github.com/crossoverJie/Java-Interview")
        let request = URLRequest(url: url!)
        webView.load(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
