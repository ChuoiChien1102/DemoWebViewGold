//  OnlineAppCreator.com
//  WebViewGold for iOS // webviewgold.com

import Foundation
import UIKit

public struct Constants {
    
    //In-App Purchase and In-App Subscription Settings (details can be configured in App Store Connect)
    static let AppBundleIdentifier = Bundle.main.bundleIdentifier //Default Bundle Identifier
    static let InAppPurchAppBundleIdentifier = "com.webviewgold.IAPProduct" //Default In-App Purchase Bundle Identifier
    static var IAPSharedSecret = "6d2496d573c246cdb4bbe0e0595a8f49" //Default In-App Purchase Shared Secret
    static let iapsuccessurl = "https://www.google.com/" //Default In-App Purchase/In-App Subscription Success URL
    static let iapexpiredurl = "https://www.yahoo.com/" //Default In-App Subscription Expired URL

    
    static let kAppDelegate         = UIApplication.shared.delegate as! AppDelegate
    static let kUserDefaults        = UserDefaults.standard
    static let kScreenWidth         = UIScreen.main.bounds.width
    static let kScreenHeight        = UIScreen.main.bounds.height
    static let kAppDisplayName      = UIApplication.appName
    static let kAppVersion          = UIApplication.shortVersionString
    static let kCountryCode         = UIApplication.countryCode
    static let kCalendar            = Calendar.current
    static let kDeviceType          = "ios"
    static let kSystemVersion       = UIDevice.current.systemVersion
    static let kModel               = UIDevice.current.model
    static let kDeviceId            = UIDevice.current.identifierForVendor!.uuidString
    
    //OneSignal Configuration
    static let kPushEnabled         = false; //Set to true to activate the OneSignal push functionality (set App ID in AppDelegate.swift)
    static let kPushEnhanceUrl      = false; //Set to true if you want to extend WebView Main URL requests by ?onesignal_push_id=XYZ
    static let kPushReloadOnUserId  = false; //Set to true if WebView should be reloaded after receiving the UserID from OneSignal
    static let kPushOpenDeeplinkInBrowser  = false; //Set to true to open deeplinking URLs from OneSignal in the Safari browser instead of the main WebView

    //AdMob Configuration
    static var AdmobBannerID = "ca-app-pub-3940256099942544/2934735716" //Set the AdMob ID for banner ads
    static var AdmobinterstitialID = "ca-app-pub-3940256099942544/4411468910" //Set the AdMob ID for interstitial ads
    static let showBannerAd = false //Set to "true" to activate AdMob banner ads
    static let showFullScreenAd = false //Set to "true" to activate AdMob interstitial full-screen ads after X website clicks
    static var showadAfterX = 5 //Show AdMob interstitial ads each X website requests/loads
    
    //Firebase Configuration
    static let kFirebasePushEnabled   = false; //Set to true to activate the Firebase push functionality (before activating, please download and replace Google-ServiceInfo.plist from Firebase Dashboard)
    
    static let appendlanguage = false //Set to true if you want to extend URL request by the system language like ?webview_language=LANGUAGE CODE (e.g., ?webview_language=EN for English users)
    static let offlinelocalhtmlswitch = false //Set to true if you want to use the "local-html" folder if the user is offline, and use the remote URL if the user is online
    static let extentionARY:NSArray = ["pdf","mp3","mp4","wav","epub","pkpass","pptx","ppt","doc","docx","xlsx","ics"] //Add the file formats that should trigger the file downloader functionality (e.g., .pdf, .docx, ...)
    static let loadingSigncolor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) //Set a color for the loading sign indicator
    static let splshscreencolor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //Set a background color for the splash screen
}

public struct AlertMessage{
    static let dataMissing = "Something went wrong. Please try again."
}

import UIKit
import SystemConfiguration
public class InternetConnectionManager {


    private init() {

    }

    public static func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {

            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {

                SCNetworkReachabilityCreateWithAddress(nil, $0)

            }

        }) else {

            return false
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }

}
