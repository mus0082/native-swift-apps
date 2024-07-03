//
//  ViewController.swift
//  CreatingBasicWebBrowser
//
//  Created by Muhammed Siddiqui on 2024-06-21.
//

//MARK: IMPORTS FRAMEWORK
import UIKit
import WebKit

//MARK: Parent class
class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var urlField: UITextField!
    
    @IBOutlet weak var webKit: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: OVERRIDE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webKit.uiDelegate = self
        urlField.delegate = self
        webKit.navigationDelegate = self
    }
    
    //MARK: METHOD FOR BROWSING
    @IBAction func urlGo(_ sender: UIButton) {
        let url = URL(string: "\(urlField.text!)")
        if url == nil{
            urlField.text = "https://www.apple.com"
            let defaultUrl = URL(string: "https://www.apple.com")
            webKit.load(URLRequest(url: defaultUrl ?? url!))
        }else{
            webKit.load(URLRequest(url: url!))
        }
       
    }
    
//MARK: METHOD FOR FORWARD
    @IBAction func forward(_ sender: UIButton) {
        if webKit.canGoForward{
            webKit.goForward()
      
        }
    }
    
    //MARK: METHOD FOR BACK
    @IBAction func back(_ sender: UIButton) {
        if webKit.canGoBack{
            webKit.goBack()
        }
    }
    
    //MARK: RELOAD
    @IBAction func reload(_ sender: UIButton) {
        webKit.reload()
    }
}

//MARK: CONFORM DELEGATE METHODS
extension ViewController: WKUIDelegate, UITextFieldDelegate, WKNavigationDelegate {
    
    func dynamicUrl(){
        let url = URL(string: "\(urlField.text!)")
        let defaultUrl = URL(string: "https://www.apple.com")!
        webKit.load(URLRequest(url: (url ?? defaultUrl)))
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        if activityIndicator.isAnimating{
            activityIndicator.stopAnimating()
        }else{
            activityIndicator.startAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if activityIndicator.isAnimating{
            activityIndicator.stopAnimating()
        }
            
    }
}

