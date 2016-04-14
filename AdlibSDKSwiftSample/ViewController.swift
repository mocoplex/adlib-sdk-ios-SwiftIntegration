//
//  ViewController.swift
//  AdlibSDKSwiftSample
//
//  Created by gskang on 2016. 4. 14..
//  Copyright © 2016년 mocoplex. All rights reserved.
//

import UIKit


class ViewController: UIViewController, AdlibManagerDelegate {

    @IBOutlet weak var adView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
       
        let sharedManager = AdlibManager.sharedSingletonClass()
        sharedManager.attach(self, withView: adView, withDelegate: self)
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        let sharedManager = AdlibManager.sharedSingletonClass()
        sharedManager.detach(self)
    }
    
    //전면광고 요청 버튼처리
    @IBAction func actionButton() {
        
        let sharedManager = AdlibManager.sharedSingletonClass()
        sharedManager.delegate = self
        sharedManager.loadInterstitialAd(self, withDelegate: self)
    }
    
    //애드립 띠배너 Delegate 처리
    func didReceiveAdlibAd(from: String!) {
        print("received adlib Ad")
    }
    
    func didFailToReceiveAdlibAd(from: String!) {
        print("didFailed adlib Ad")
    }
    
    //애드립 전면배너 Delegate 처리
    func didReceiveAdlibInterstitialAd(from: String!) {
        print("received adlib interstitial Ad")
    }
    
    func didFailToReceiveAllInterstitialAd() {
        print("failed to load adlib interstitial Ad")
    }

}

