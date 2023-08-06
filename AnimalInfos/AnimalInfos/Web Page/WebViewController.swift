//
//  WebViewController.swift
//  AnimalInfos
//
//  Created by deniz on 14.07.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: urlString!)!))
    }
    

}
