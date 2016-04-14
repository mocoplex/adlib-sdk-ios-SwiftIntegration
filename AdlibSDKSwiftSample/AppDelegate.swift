//
//  AppDelegate.swift
//  AdlibSDKSwiftSample
//
//  Created by gskang on 2016. 4. 14..
//  Copyright © 2016년 mocoplex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AdlibSessionDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
 
        
        // 애드립 키로 초기화
        // 실제 사용하실 키로 교체하여 진행하시길 바랍니다.
        // 테스트 키세팅 띠배너 미디에이션 :(애드립, 애드몹, 아담)
        // 테스트 키세팅 전면배너 미디에이션 :(애드립, 애드몹, 아담, 애드립하우스)
        
        let adlibKey: String = "54caefb80cf28de2af4e7001"
        
        let sharedManager = AdlibManager.sharedSingletonClass()
        sharedManager.sessionDelegate = self
        
        //사용할 미디에이션 플랫폼 추가
        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.ADMOB , withClass: SubAdlibAdViewAdmob.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.ADAM, withClass: SubAdlibAdViewAdam.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.ADMIXER, withClass: SubAdlibAdAdmixer.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.CAULY, withClass: SubAdlibAdViewCauly.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.INMOBI, withClass: SubAdlibAdViewInmobi.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.TAD, withClass: SubAdlibAdViewTAD.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.SHALLWEAD, withClass: SubAdlibAdViewShallWeAd.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.IAD, withClass: SubAdlibAdViewiAd.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.ADHUB, withClass: SubAdlibAdViewAdHub.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.DOMOB, withClass: SubAdlibAdViewDomob.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.MEDIBAAD, withClass: SubAdlibAdViewMedibaAd.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.NAVER, withClass: SubAdlibAdViewNaverAdPost.classForCoder())
//        sharedManager.registerPlatform(ADLIB_MEDPLATFORM.FACEBOOK, withClass: SubAdlibAdViewFacebook.classForCoder())
        
        //테스트, 사용 모드 설정
        let isTestMode = true
        
        if isTestMode {
            sharedManager.testModeLinkWithAdlibKey(adlibKey)
        } else {
            sharedManager.linkWithAdlibKey(adlibKey)
        }
        
        return true
    }
    
    func adlibManager(manager: AdlibManager!, didLinkedSessionWithUserInfo userInfo: [NSObject : AnyObject]!) {
        print("adlib linked")
    }
    
    func adlibManager(manager: AdlibManager!, didFailedSessionLinkWithError error: NSError!) {
        print("adlib link failed")
    }
}

