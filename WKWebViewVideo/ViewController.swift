//
//  ViewController.swift
//  WKWebViewVideo
//
//  Created by Ryan Lovelett on 11/9/15.
//  Copyright © 2015 Ryan Lovelett. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

  var webView: WKWebView?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let contentController = WKUserContentController()

    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    config.allowsInlineMediaPlayback = true
    config.allowsAirPlayForMediaPlayback = true
    config.requiresUserActionForMediaPlayback = true
    config.allowsPictureInPictureMediaPlayback = true

    self.webView = WKWebView(frame: CGRectZero, configuration: config)
    self.view.addSubview(self.webView!)

    webView?.translatesAutoresizingMaskIntoConstraints = false
    let horizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["webView": webView!])
    let vertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|[webView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["webView": webView!])
    view.addConstraints(horizontal)
    view.addConstraints(vertical)

    let libraryDirectory = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)[0]
    let libraryIndex = libraryDirectory.URLByAppendingPathComponent("index").URLByAppendingPathExtension("html")
    webView?.loadFileURL(libraryIndex, allowingReadAccessToURL: libraryDirectory)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

