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
    
    private let site: String = "http://apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
