//
//  SiteViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import UIKit
import WebKit

class SiteViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var site: String! = "http://apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: site) else { return }
        webView.load(URLRequest(url: url))
    }
}
