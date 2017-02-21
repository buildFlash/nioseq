//
//  ViewController.swift
//  Noiseq
//
//  Created by Aryan Sharma on 19/02/17.
//  Copyright © 2017 Aryan Sharma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.loadRequest(NSURLRequest(url: NSURL(string: "http://noiseq.com")! as URL) as URLRequest)
        WebView.allowsInlineMediaPlayback = true
        WebView.allowsPictureInPictureMediaPlayback = false

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            // Handle setCategory failure
            print(error)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(AppResigned), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        
    }

    func AppResigned() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

