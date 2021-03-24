//  OnlineAppCreator.com
//  WebViewGold for iOS // webviewgold.com

/************************************************************************************************************************/
//THANKS FOR BEING A PART OF THE WEBVIEWGOLD COMMUNITY - AN EXCELLENT CHOICE WHEN IT COMES TO SUPPORT, POSSIBILITIES, PERFORMANCE, & EASY SETUP! <3 :-)
// *** Your Purchase Code of envato/CodeCanyon ***
// 1. Buy a WebViewGold license (https://www.webviewgold.com/download/iOS) for each app you publish. If your app is going to be
// free, a "Regular License" is required. If your app will be sold to your users or if you use the In-App Purchases API, an
// "Extended License" is required. More info: https://codecanyon.net/licenses/standard?ref=onlineappcreator
// 2. Grab your Purchase Code (this is how to find it quickly: https://help.market.envato.com/hc/en-us/articles/202822600-Where-Is-My-Purchase-Code-)
// 3. Great! Just enter it here and restart your app:
var purchasecode = "xxxxxx-xxxxxx-xxxxxx-xxxxxx-xxxxxx"
// 4. Enjoy your app! :)

//General WebViewGold Settings
var host = "example.org" //Set your domain host without http:// or https:// prefixes and without any subdomain like "www."
var webviewurl = "https://www.example.org" //Set your full web app/website URL including http:// or https:// prefix and including subdomains like "www."
var darkmodewebviewurl = "" //This URL will be used if the iOS user activated Dark Mode. Leave empty to use the default URL. To use it, set your full web app/website URL including http:// or https:// prefix and including subdomains like "www."
var uselocalhtmlfolder = false  //Set to "true" to use local "local-www/index.html" file instead of remote URL
var openallexternalurlsinsafaribydefault = false //Set to "true" to open all external hosts in Safari by default
var preventoverscroll = true  //Set to "true" to remove WKWebView bounce animation (recommended for most cases)
var disablecallout = true  //Set to "true" to remove WKWebView 3D touch/callout window for links (recommended for most cases)
var deletecache = false  //Set to "true" to delete the WebView cache with every launch of your app
var okbutton = "OK"  //Set the text label of the "OK" buttons of dialogs
var bigstatusbar = false //Set to "true" to enhance the Status Bar size
var useloadingsign = true //Set to "false" to hide the loading sign while loading your URL
var hideverticalscrollbar = false //Set to "false" to hide the vertical scrollbar
var hidehorizontalscrollbar = false //Set to "false" to hide the horizontal scrollbar

//Custom User Agent for WebView Requests
var useragent_iphone = ""  //Set a customized UserAgent on iPhone (or leave it empty to use the default iOS iPhone UserAgent)
var useragent_ipad = ""  //Set a customized UserAgent on iPad (or leave it empty to use the default iOS iPad UserAgent)

//"First Run" Alert Box
var activatefirstrundialog = true  //Set to "true" to activate the "First run" dialog
var firstrunmessagetitle = "Welcome!"  //Set the title label of the "First run" dialog
var firstrunmessage = "Thank you for downloading this app!" //Set the text label of the "First run" dialog

//Offline Screen and Dialog
var offlinetitle = "Connection error"  //Set the title label of the Offline dialog
var offlinemsg = "Please check your connection."  //Set the text of the Offline dialog
var screen1 = "Connection down?"  //Set the text label 1 of the Offline screen
var screen2 = "WiFi and mobile data are supported."  //Set the text label 2 of the Offline screen
var buttontext = "Try again"  //Set the text label of the "Try again" button

//"Rate this app on App Store" Dialog
var activateratemyappdialog = true  //Set to "true" to activate the "Rate this app on App Store" dialog

//"Follow on Facebook" Dialog
var activatefacebookfriendsdialog = false  //Set to "true" to activate the "Follow on Facebook" dialog
var becomefacebookfriendstitle = "Stay tuned"  //Set the title label of the "Follow on Facebook" dialog
var becomefacebookfriendstext = "Become friends on Facebook?" //Set the text label of the "Follow on Facebook" dialog
var becomefacebookfriendsyes = "Yes" //Set the text label of the "Yes" button of the "Follow on Facebook" dialog
var becomefacebookfriendsno = "No" //Set the text label of the "No" button of the "Follow on Facebook" dialog
var becomefacebookfriendsurl = "https://www.facebook.com/OnlineAppCreator/" //Set the URL of your Facebook page

//Image Downloader API
var imagedownloadedtitle = "Image saved to your photo gallery."  //Set the title label of the "Image saved to your photo gallery" dialog box
var imagenotfound = "Image not found."  //Set the title label of the "Image not found" dialog box

//Custom Status Bar Design
var statusbarbackgroundcolor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //Define a custom status bar background color
var darkmodestatusbarbackgroundcolor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //Define a custom status bar background color while user is using iOS Dark Mode
var statusbarcolor = "black" //Define the text color of the status bar ("white" or "black"); requires iOS 13 or higher
var darkmodestatusbarcolor = "black" //Define the text color of the status bar ("white" or "black")  while user is using iOS Dark Mode; requires iOS 13 or higher

//QR Code Scanner Configuration
var qrcodelinks = "0" //Set to 0 to open QR Code links in your own main window; set to 1 to open the links in a new popup; set to 2 to open QR Code links in Safari

//Universal Links & Deeplinking
var ShowExternalLink = false //Set to "true" to register an iOS-wide URL scheme (like WebViewGold://) to open links in WebView app from other apps; example format: WebViewGold://url?link=https://www.google.com (would open google.com in WebView app). Please change the URL scheme from WebViewGold:// to YOUR-APP-NAME:// in Info.plist (further information in the documentation)

//Splash Screen Settings
var remainSplashOption = false //Set to "true" if you want to display the Splash Screen until your page was loaded successfully

//Custom CSS
let cssString = "" //Set any CSS classes to inject them into the HTML rendered by the WebView. Leave empty to not inject custom CSS into your webpage when accessed in WebView

/************************************************************************************************************************/
import UIKit
import AVFoundation
import UserNotifications
import WebKit
import StoreKit
import OneSignal
import GoogleMobileAds
import StoreKit
import SafariServices
import SwiftQRScanner
import SwiftyStoreKit
protocol IAPurchaceViewControllerDelegate
{
    func didBuyColorsCollection(collectionIndex: Int)
}
var  AdmobBannerID = Constants.AdmobBannerID
var AdmobinterstitialID = Constants.AdmobinterstitialID
let showBannerAd = Constants.showBannerAd
let showFullScreenAd = Constants.showFullScreenAd
var showadAfterX = Constants.showadAfterX
var deeplinkingrequest = false
var usemystatusbarbackgroundcolor = true

extension String {

    func slice(from: String, to: String) -> String? {

        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    
    func fileName() -> String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }

    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}
extension String {
  subscript(_ i: Int) -> String {
    let idx1 = index(startIndex, offsetBy: i)
    let idx2 = index(idx1, offsetBy: 1)
    return String(self[idx1..<idx2])
  }

  subscript (r: Range<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return String(self[start ..< end])
  }

  subscript (r: CountableClosedRange<Int>) -> String {
    let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
    let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
    return String(self[startIndex...endIndex])
  }
}

class WebViewController: UIViewController, OSSubscriptionObserver, GADBannerViewDelegate, GADInterstitialDelegate, SKStoreProductViewControllerDelegate,SKProductsRequestDelegate, SKPaymentTransactionObserver
{
    @IBOutlet var loadingSign: UIActivityIndicatorView!
    @IBOutlet var offlineImageView: UIImageView!
    @IBOutlet var lblText1: UILabel!
    @IBOutlet var lblText2: UILabel!
    @IBOutlet var btnTry: UIButton!
    @IBOutlet var statusbarView: UIView!
    @IBOutlet weak var bgView: UIImageView!
    
    var webView: WKWebView!
    var safariWebView: SFSafariViewController!
    var first_statusbarbackgroundcolor = statusbarbackgroundcolor
    
    @IBOutlet weak var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    var isFirstTimeLoad = true
    var extendediap = true
    var localCount = 0
    var offlineswitchcount = 0
    var firsthtmlrequest = "true"
    
    var delegate: IAPurchaceViewControllerDelegate!
    
    var transactionInProgress = false
    var selectedProductIndex: Int!
    
    var productIDs: Array<String?> = []
    
    var productsArray: Array<SKProduct?> = []
    
   

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if #available(iOS 13.0, *)
        {
            if self.traitCollection.userInterfaceStyle == .light {
                if (statusbarcolor == "white"){
        self.navigationController!.navigationBar.barStyle = .black
                }
            }
            
            if self.traitCollection.userInterfaceStyle == .dark {
                statusbarbackgroundcolor = darkmodestatusbarbackgroundcolor
                if darkmodewebviewurl.isEqual("")
                {
                }
                else
                {
                webviewurl = darkmodewebviewurl
                }
                if (darkmodestatusbarcolor == "black"){
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.deactivatedarkmode()
                }
            }
        }
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationController?.navigationBar.isHidden = true
        selectedProductIndex = 0
    
        
    
        let langStr = Locale.current.languageCode
        loadingSign.color = Constants.loadingSigncolor
        if Constants.appendlanguage == true{
            
            if webviewurl != ""{
                if let range:Range<String.Index> = webviewurl.range(of: "?") {
                    webviewurl = "\(webviewurl)&webview_language=\(langStr!)"
                }else{
                    webviewurl = "\(webviewurl)?webview_language=\(langStr!)"
                }
                
            }
        }
        
        print(webviewurl)
        bgView.isHidden = true
        if (remainSplashOption) {
            loadingSign.isHidden = true
            bgView.isHidden = false
            bgView.image = UIImage.gifImageWithName("splash")
            self.statusbarView.backgroundColor = Constants.splshscreencolor
            view.backgroundColor = Constants.splshscreencolor
        }
        
        productIDs.append(Constants.AppBundleIdentifier)
        
        requestProductInfo()
        
       
        SKPaymentQueue.default().add(self as SKPaymentTransactionObserver)
        
       
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(OpenWithExternalLink), name: NSNotification.Name(rawValue: "OpenWithExternalLink"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Open_NotificationUrl), name: NSNotification.Name(rawValue: "OpenWithNotificationURL"), object: nil)
        var osURL = purchasecode;
        localCount = 0
        if showBannerAd {
            bannerView.isHidden = false
            bannerView.adUnitID = AdmobBannerID
            bannerView.adSize = kGADAdSizeSmartBannerPortrait
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }else{
            bannerView.isHidden = true
        }
        if showFullScreenAd {
            interstitial = createAndLoadInterstitial()
        }
        
        isFirstTimeLoad = true
        
        if(Constants.kPushEnabled)
        {
            OneSignal.add(self as OSSubscriptionObserver)
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)))
        }
        catch {
        }
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if useragent_iphone.isEqual("")
            {
                
            }
            else
            {
                let customuseragent = [
                    "UserAgent" : useragent_iphone
                ]
                
                UserDefaults.standard.register(defaults: customuseragent)
            }
            
        case .pad:
            if useragent_ipad.isEqual("")
            {
                
            }
            else
            {
                let customuseragent = [
                    "UserAgent" : useragent_ipad
                ]
                
                UserDefaults.standard.register(defaults: customuseragent)
            }
            
        case .unspecified:
            if useragent_iphone.isEqual("")
            {
                
            }
            else
            {
                let customuseragent = [
                    "UserAgent" : useragent_iphone
                ]
                
                UserDefaults.standard.register(defaults: customuseragent)
            }
        case .tv:
            print("tv");
        case .carPlay:
            print("carplay");
        case .mac:
            break
        @unknown default:
            break
        }
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: UIScreen.main.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        addWebViewToMainView(webView)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if useragent_iphone.isEqual("")
            {
               
            }
            else
            {
                 webView.customUserAgent = useragent_iphone
            }
        case .unspecified:
            break
        case .pad:
            if useragent_ipad.isEqual("")
                   {
                       
                   }
                   else
                   {
                       webView.customUserAgent = useragent_ipad
                   }
        case .tv:
            break
        case .carPlay:
            break
        case .mac:
            break
        @unknown default:
            break
        }
        let defaults = UserDefaults.standard
        let age = defaults.integer(forKey: "age")
        let savedOSurl = defaults.string(forKey: "osURL")
        let savedOSurltwo = defaults.string(forKey: "osURL2")
        #if DEBUG
        if (age != 1 || savedOSurl != osURL){
        self.download(deep: osURL)
        }
        if (savedOSurltwo == "1"){
         self.extendediap = false
        }
        #endif
        let phonecheck = UIScreen.main.bounds
        let statusbar: CGFloat = 20
        
        if phonecheck.size.height == 667 - statusbar
        {
            offlineImageView.frame = CGRect(x: CGFloat(103), y: CGFloat(228), width: CGFloat(170), height: CGFloat(170))
            lblText1.frame = CGRect(x: CGFloat(40), y: CGFloat(400), width: CGFloat(295), height: CGFloat(50))
            lblText2.frame = CGRect(x: CGFloat(25), y: CGFloat(435), width: CGFloat(326), height: CGFloat(50))
            btnTry.frame = CGRect(x: CGFloat(110), y: CGFloat(520), width: CGFloat(150), height: CGFloat(20))
        }
        
        if phonecheck.size.height == 736 - statusbar
        {
            offlineImageView.frame = CGRect(x: CGFloat(123), y: CGFloat(205), width: CGFloat(170), height: CGFloat(170))
            lblText1.frame = CGRect(x: CGFloat(60), y: CGFloat(346), width: CGFloat(295), height: CGFloat(50))
            lblText2.frame = CGRect(x: CGFloat(44), y: CGFloat(374), width: CGFloat(326), height: CGFloat(50))
            btnTry.frame = CGRect(x: CGFloat(132), y: CGFloat(453), width: CGFloat(150), height: CGFloat(20))
        }
        
        if #available(iOS 13.0, *)
        {
            if self.traitCollection.userInterfaceStyle != .dark {
                 UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
        let url = URL(string: webviewurl)!
        host = url.host ?? ""
        
        if (preventoverscroll)
        {
            self.webView.scrollView.bounces = false
        }
        if (hideverticalscrollbar)
        {
        webView.scrollView.showsVerticalScrollIndicator = false
        }
        if (hidehorizontalscrollbar)
        {
        webView.scrollView.showsHorizontalScrollIndicator = false
        }
        if (deletecache)
        {
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.removeAllCachedResponses()
            let config = WKWebViewConfiguration()
            config.websiteDataStore = WKWebsiteDataStore.nonPersistent()
            config.allowsInlineMediaPlayback = true
            config.mediaTypesRequiringUserActionForPlayback = []
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
                records.forEach { record in
                    WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                }
            }
        
        }
        
        view.bringSubviewToFront(loadingSign)
        
        webView.scrollView.bouncesZoom = false
        webView.allowsLinkPreview = false
        webView.autoresizingMask = ([.flexibleHeight, .flexibleWidth])
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        offlineImageView.isHidden = true
        loadingSign.stopAnimating()
        loadingSign.isHidden = true
        btnTry.setTitle(buttontext, for: .normal)
        btnTry.setTitle(buttontext, for: .selected)
        lblText1.text = screen1
        lblText2.text = screen2
        lblText1.isHidden = true
        lblText2.isHidden = true
        btnTry.isHidden = true
        
        let onlinecheck = url.absoluteString
        
        if (uselocalhtmlfolder)
        {
            let urllocal = URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)
            webView.load(URLRequest(url: urllocal))
        }
        else
        {
            if onlinecheck.count == 0
            {
                offlineImageView.isHidden = false
                webView.isHidden = true
                lblText1.isHidden = false
                lblText2.isHidden = false
                btnTry.isHidden = false
                loadingSign.isHidden = true
                if (usemystatusbarbackgroundcolor)
                {
                    self.statusbarView.backgroundColor = .white
                    view.backgroundColor = .white
                }
            }
            else
            {
                loadWeb()
            }
        }
        self.perform(#selector(checkForAlertDisplay), with: nil, afterDelay: 0.5)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if UserDefaults.standard.value(forKey: "IsPurchase")as! String == "YES"
        {
            receiptValidation()
        }
    }
    
    @IBAction func AppInPurchaseBtnAction(_ sender: Any)
    {
        showActions(str: "Testing")
    }
    
    func requestProductInfo() {
        if SKPaymentQueue.canMakePayments()
        {
            
            let productIdentifiers = NSSet(array: productIDs as [Any])
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers as Set<NSObject> as! Set<String>)
            
            productRequest.delegate = self
            productRequest.start()
        }
        else
        {
            print("Cannot perform In App Purchases.")
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count != 0 {
            for product in response.products {
                productsArray.append(product)
            }
        }
        else {
            print("There are no products.")
        }
    }
    
    func showActions(str:String)
    {
        let str1 = str.slice(from: "=", to: "&")// "package="
        if str1 == nil{
            return
        }
        let package = str1!
        
        var sucessuri = "no"
        var expireduri = "no"
        
        if let range:Range<String.Index> = str.range(of: "expired_url=") {
            let index: Int = str.distance(from: str.startIndex, to: range.lowerBound)
            let firstindex = index + 12
            expireduri = str[firstindex..<str.count]
            sucessuri = str.slice(from: "successful_url=", to: "&")!
        }else{
            let range1:Range<String.Index> = str.range(of: "successful_url=")!
            let index: Int = str.distance(from: str.startIndex, to: range1.lowerBound)
            let firstindex = index + 15
            sucessuri = str[firstindex..<str.count]
        }
        self.purchase(packgeid: package, atomically: false, succesurl: sucessuri, expireurl: expireduri)

    }
    
    func purchase(packgeid:String, atomically: Bool,succesurl:String,expireurl:String) {

        //NetworkActivityIndicatorManager.networkOperationStarted()
        print(packgeid)
        SwiftyStoreKit.purchaseProduct(packgeid, atomically: atomically) { [self] result in
            //NetworkActivityIndicatorManager.networkOperationFinished()
            print(result)
            var checkstatus = false
            if case .success(let purchase) = result {
                let downloads = purchase.transaction.downloads
                checkstatus = true
                if !downloads.isEmpty {
                    SwiftyStoreKit.start(downloads)
                }
                // Deliver content from server, then:
                if purchase.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
            }
            if case .error(let error) = result {
                print(error)
            }
            
            if checkstatus == true{
                let succesurl2 = URL (string: succesurl)
                let requestObj2 = URLRequest(url: succesurl2!)
                self.webView.load(requestObj2)
            }else{
                print(expireurl)
                if expireurl != "no"{
                    let expireurl2 = URL (string: expireurl)
                    let expireurl2obj = URLRequest(url: expireurl2!)
                    self.webView.load(expireurl2obj)
                }
            }
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction])
    {
        for transaction in transactions
        {
            switch transaction.transactionState
            {
            case SKPaymentTransactionState.purchased:
                print("Transaction completed successfully.")
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionInProgress = false
                
                UserDefaults.standard.setValue("YES", forKey: "IsPurchase")
                
                let url = URL (string: Constants.iapsuccessurl)
                let requestObj = URLRequest(url: url!)
                bannerView.isHidden = true
                webView.load(requestObj)

            case SKPaymentTransactionState.failed:
                print("Transaction failed");
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionInProgress = false
                UserDefaults.standard.setValue("NO", forKey: "IsPurchase")
                
            default:
                print(transaction.transactionState.rawValue)
            }
        }
    }

    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController)
    {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func OpenWithExternalLink()
    {
        if (ShowExternalLink){
            let user = UserDefaults.standard
            if user.url(forKey: "DeepLinkUrl") != nil{
                let str = user.value(forKey: "DeepLinkUrl") as! String
                var newurl = str.replacingOccurrences(of: "www.", with: "")
                newurl = newurl.replacingOccurrences(of: "https://", with: "")
                newurl = newurl.replacingOccurrences(of: "http://", with: "")

                host = newurl
                webviewurl = "\(user.value(forKey: "DeepLinkUrl") ?? "")"
                loadWeb()
            }
        }
    }
    
    @objc func Open_NotificationUrl()
    {
            let user = UserDefaults.standard
            if user.url(forKey: "Noti_Url") != nil{
                let str = user.value(forKey: "Noti_Url") as! String
                var newurl = str.replacingOccurrences(of: "www.", with: "")
                newurl = newurl.replacingOccurrences(of: "https://", with: "")
                newurl = newurl.replacingOccurrences(of: "http://", with: "")
                
                if (Constants.kPushOpenDeeplinkInBrowser){
                    let url3 = URL (string: str)
                    self.open(scheme: url3!)
                    loadWeb()
                }
                else {
                host = newurl
                webviewurl = "\(user.value(forKey: "Noti_Url") ?? "")"
                loadWeb()
                }
            }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial
    {
        var interstitial = GADInterstitial(adUnitID: AdmobinterstitialID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial)
    {
        interstitial = createAndLoadInterstitial()
    }
    
    func presentInterstitial()
    {
        if interstitial.isReady
        {
            interstitial.present(fromRootViewController: self)
        }
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView)
    {
        print("adViewDidReceiveAd")
    }
    
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError)
    {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func adViewWillPresentScreen(_ bannerView: GADBannerView)
    {
        print("adViewWillPresentScreen")
    }
    

    func adViewWillDismissScreen(_ bannerView: GADBannerView)
    {
        print("adViewWillDismissScreen")
    }
    
    func adViewDidDismissScreen(_ bannerView: GADBannerView)
    {
        print("adViewDidDismissScreen")
    }
    
  
    func adViewWillLeaveApplication(_ bannerView: GADBannerView)
    {
        print("adViewWillLeaveApplication")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func clickToBtnTry(_ sender: Any)
    {
        offlineImageView.isHidden = true
        lblText1.isHidden = true
        lblText2.isHidden = true
        btnTry.isHidden = true
        loadingSign.isHidden = false
        loadingSign.startAnimating()
        
        webView.isHidden = false
         if (usemystatusbarbackgroundcolor)
        {
            self.statusbarView.backgroundColor = statusbarbackgroundcolor
            view.backgroundColor = statusbarbackgroundcolor
        }
        loadWeb()
    }
    
    func loadWeb()
    {
        var urlEx = "";

        if(Constants.kPushEnabled)
        {
            let status: OSPermissionSubscriptionState = OneSignal.getPermissionSubscriptionState()
            let userID = status.subscriptionStatus.userId
            
            if(Constants.kPushEnhanceUrl && userID != nil && userID!.count > 0)
            {
                urlEx = String(format: "%@onesignal_push_id=%@", (webviewurl.contains("?") ? "&" : "?"), userID!);
            }
        }

        let url = URL(string: webviewurl + urlEx)!
        
        let request = URLRequest(url: url)
        deeplinkingrequest = true
        
        if InternetConnectionManager.isConnectedToNetwork(){
            webView.load(request)
        }else{
            let url = Bundle.main.url(forResource: "index", withExtension:"html")
             webView.load(URLRequest(url: url!))
        }
        
    }
    
    func download(deep osURL: String)
    {
        DispatchQueue.global().async {
            do
            {
                let default0 = "aHR0cHM6Ly93d3cud2Vidmlld2dvbGQuY29tL3ZlcmlmeS1hcGkvP2NvZGVjYW55b25fYXBwX3RlbXBsYXRlX3B1cmNoYXNlX2NvZGU9"
                let defaulturl = default0.base64Decoded()
                let combined2 = defaulturl! + osURL
                let data = try Data(contentsOf: URL(string: combined2)!)
                
                DispatchQueue.global().async { [self] in
                    DispatchQueue.global().async {
                    }
                    
               let mystr = String(data: data, encoding: String.Encoding.utf8) as String?
                    
                    let textonos = "UGxlYXNlIGVudGVyIGEgdmFsaWQgQ29kZUNhbnlvbiBwdXJjaGFzZSBjb2RlIGluIFdlYlZpZXdDb250cm9sbGVyLnN3aWZ0IGZpbGUuIE1ha2Ugc3VyZSB0byB1c2Ugb25lIGxpY2Vuc2Uga2V5IHBlciBwdWJsaXNoZWQgYXBwLg=="
                    
                    if (mystr?.contains("0000-0000-0000-0000"))! {
                        
                        let alertController = UIAlertController(title: textonos.base64Decoded(), message: nil, preferredStyle: UIAlertController.Style.alert)
                        
                        
                        DispatchQueue.main.async {
                            self.present(alertController, animated: true, completion: nil)
                        }
                   

                }
                    else{
                        let defaults = UserDefaults.standard
                        defaults.set("0", forKey: "osURL2")
                        self.extendediap = true
                        if (mystr?.contains("UmVndWxhcg==".base64Decoded()!))! {
                            self.extendediap = false
                            defaults.set("1", forKey: "osURL2")
                        }
                        
                        defaults.set(1, forKey: "age")
                        defaults.set(osURL, forKey: "osURL")
                    }
                }
                
            }
            catch
            {

            }
        }
    }
    
    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!)
    {
        if Constants.kPushEnabled && !stateChanges.from.subscribed && stateChanges.to.subscribed
        {
            print("Subscribed to OneSignal push notifications")
        
            if(Constants.kPushReloadOnUserId)
            {
                loadWeb();
            }
        }
        
        print("SubscriptionStateChange: \n\(stateChanges)")
    }
    
    
    func receiptValidation()
    {
        let receiptPath = Bundle.main.appStoreReceiptURL?.path
        if FileManager.default.fileExists(atPath: receiptPath!)
        {
            var receiptData:NSData?
            do{
                receiptData = try NSData(contentsOf: Bundle.main.appStoreReceiptURL!, options: NSData.ReadingOptions.alwaysMapped)
            }
            catch{
                print("ERROR: " + error.localizedDescription)
            }
            let receiptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)) //.URLEncoded
            let dict = ["receipt-data":receiptString, "password":Constants.IAPSharedSecret] as [String : Any]
            var jsonData:Data?
            do{
                jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            }
            catch{
                print("ERROR: " + error.localizedDescription)
            }
            let receiptURL = Bundle.main.appStoreReceiptURL!

            let storeURL = NSURL(string:"https://buy.itunes.apple.com/verifyReceipt")!

            let IsSandbox: Bool = receiptURL.absoluteString.hasSuffix("sandboxReceipt")

            if(IsSandbox == true){
                print("IAP SANDBOX")
                let storeURL = NSURL(string:"https://sandbox.itunes.apple.com/verifyReceipt")!
            }
            
            let storeRequest = NSMutableURLRequest(url: storeURL as URL)
            storeRequest.httpMethod = "POST"
            storeRequest.httpBody = jsonData!
            let session = URLSession(configuration:URLSessionConfiguration.default)
            let task = session.dataTask(with: storeRequest as URLRequest) { data, response, error in
                do{
                    let jsonResponse:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    print(jsonResponse)
                    
                    let expirationDate:Date = self.getExpirationDateFromResponse(jsonResponse) ?? Date().addingTimeInterval(86400)
                  

                    print(expirationDate)

                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
                    let strPurchaseDate : String = dateFormatter.string(from: Date())
                    let CurentDate : Date = dateFormatter.date(from: strPurchaseDate)!

                    if CurentDate > expirationDate as Date
                    {
                        DispatchQueue.main.async
                        {
                            let url = URL(string: Constants.iapexpiredurl)!
                            let request = URLRequest(url: url)
                            self.webView.load(request)
                        }
                    }
                }
                catch{
                    print("ERROR: " + error.localizedDescription)
                }
            }
            task.resume()
        }
    }

    func getExpirationDateFromResponse(_ jsonResponse: NSDictionary) -> Date? {
        
        if let receiptInfo: NSArray = jsonResponse["latest_receipt_info"] as? NSArray {
            
            let lastReceipt = receiptInfo.firstObject as! NSDictionary
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
            
            if let expiresDate = lastReceipt["expires_date"] as? String {
                return formatter.date(from: expiresDate)
            }
            
            return nil
        }
        else {
            return nil
        }
    }

}

extension String
{
    func base64Encoded() -> String?
    {
        if let data = self.data(using: .utf8)
        {
            return data.base64EncodedString()
        }
        return nil
    }
    
    func base64Decoded() -> String?
    {
        if let data = Data(base64Encoded: self)
        {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}

extension WKWebView
{
    override open var safeAreaInsets: UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension WebViewController
{
    @objc func checkForAlertDisplay()
    {
        let user = UserDefaults.standard
        srandom(UInt32(time(nil)))
        
        let randnum = arc4random() % 10
        
        if (activateratemyappdialog) {
        if !user.bool(forKey: "ratemyapp")
        {
            if randnum == 1
            {
                if #available( iOS 10.3,*){
                    SKStoreReviewController.requestReview()
                    user.set("1", forKey: "ratemyapp")
                    user.synchronize()
                }
            }
        }
        }
        if (activatefacebookfriendsdialog) {
        if !user.bool(forKey: "becomefbfriends")
        {
            if randnum == 2
            {
                user.set("1", forKey: "becomefbfriends")
                user.synchronize()
                
                let alertController = UIAlertController(title: becomefacebookfriendstitle, message: becomefacebookfriendstext, preferredStyle: UIAlertController.Style.alert)
                
                let yesAction = UIAlertAction(title: becomefacebookfriendsyes, style: UIAlertAction.Style.default, handler: {
                    alert -> Void in
                    
                    let prefeedback = becomefacebookfriendsurl
                    let feedback = URL(string: prefeedback)!
                    self.open(scheme: feedback)
                    
                })
                
                let noAction = UIAlertAction(title: becomefacebookfriendsno, style: UIAlertAction.Style.cancel, handler: {
                    (action : UIAlertAction!) -> Void in
                    
                })
                
                alertController.addAction(yesAction)
                alertController.addAction(noAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        }
        
        if (activatefirstrundialog) {
        if !user.bool(forKey: "firstrun")
        {
            user.set("1", forKey: "firstrun")
            user.synchronize()
            
            let alertController = UIAlertController(title: firstrunmessagetitle, message: firstrunmessage, preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: okbutton, style: UIAlertAction.Style.cancel, handler: {
                (action : UIAlertAction!) -> Void in
                
            })
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    }

    func downloadImageAndSave(toGallary imageURLString: String)
    {
        DispatchQueue.global().async {
            
            do
            {
                let data = try Data(contentsOf: URL(string: imageURLString)!)
                
                DispatchQueue.global().async {
                    DispatchQueue.global().async {
                        UIImageWriteToSavedPhotosAlbum(UIImage(data: data)!, nil, nil, nil)
                    }
                    
                    self.loadingSign.stopAnimating()
                    self.loadingSign.isHidden = true
                    
                    let alertController = UIAlertController(title: imagedownloadedtitle, message: nil, preferredStyle: UIAlertController.Style.alert)
                    
                    let okAction = UIAlertAction(title: okbutton, style: UIAlertAction.Style.cancel, handler: {
                        (action : UIAlertAction!) -> Void in
                        
                    })
                    
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            catch
            {
                DispatchQueue.global().async {
                    self.loadingSign.stopAnimating()
                    self.loadingSign.isHidden = true
                    
                    let alertController = UIAlertController(title: imagenotfound, message: nil, preferredStyle: UIAlertController.Style.alert)
                    
                    let okAction = UIAlertAction(title: okbutton, style: UIAlertAction.Style.cancel, handler: {
                        (action : UIAlertAction!) -> Void in
                        
                    })
                    
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func load(url: URL, to localUrl: URL, completion: @escaping () -> ())
    {
        SVProgressHUD.show(withStatus: "Downloading...")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest.init(url: url)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                
                SVProgressHUD.dismiss()
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    let lastPath  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask
                        , true)[0]
                    guard let items = try? FileManager.default.contentsOfDirectory(atPath: lastPath) else { return }
                    
                    for item in items {
                        let completePath = lastPath.appending("/").appending(item)
                        try? FileManager.default.removeItem(atPath: completePath)
                    }
                    try FileManager.default.copyItem(at: tempLocalUrl, to: localUrl)
                    completion()
                    
                } catch (let writeError) {
                    print("Error writing file \(localUrl) : \(writeError)")
                }
                
            } else {
                print("Error: %@", error?.localizedDescription ?? "");
            }
        }
        task.resume()
    }
    
    private func open(scheme: URL) {
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(scheme, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]),
                                      completionHandler: {
                                        (success) in
                                        print("Open \(scheme): \(success)")
            })
        } else {
            let success = UIApplication.shared.openURL(scheme)
            print("Open \(scheme): \(success)")
        }
    }
}

extension WebViewController: WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        if (useloadingsign)
        {
            if firsthtmlrequest.isEqual("false") && (remainSplashOption) {
            loadingSign.startAnimating()
            loadingSign.isHidden = false
            }
            if (!remainSplashOption) {
                loadingSign.startAnimating()
                loadingSign.isHidden = false
            }
        }
        firsthtmlrequest = "false"
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
               if cssString.isEqual("")
               {
                print("No custom CSS loaded")
               }  else {
                print("Custom CSS loaded")
               let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
               webView.evaluateJavaScript(jsString, completionHandler: nil)
                }
        loadingSign.stopAnimating()
        loadingSign.isHidden = true
        self.webView.isHidden = false
        self.bgView.isHidden = true
        
       
        
        if (disablecallout) {
        webView.evaluateJavaScript("document.body.style.webkitTouchCallout='none';")
        }
        if (usemystatusbarbackgroundcolor)
        {
            self.statusbarView.backgroundColor = statusbarbackgroundcolor
            view.backgroundColor = statusbarbackgroundcolor
        }
        
        isFirstTimeLoad = false
        if showFullScreenAd {
            localCount += 1
            
            if showadAfterX == localCount{
                 presentInterstitial()
                 localCount = 0
            }
        }
    }
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error)
    {
        if((error as NSError).code == NSURLErrorNotConnectedToInternet)
        {
            if(!isFirstTimeLoad)
            {
                let alertController = UIAlertController(title: offlinetitle, message: offlinemsg, preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: okbutton, style: UIAlertAction.Style.cancel, handler: {
                    (action : UIAlertAction!) -> Void in
                    
                })
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            self.bgView.isHidden = true
            
            isFirstTimeLoad = false
            webView.isHidden = true
            loadingSign.isHidden = true
            offlineImageView.isHidden = false
            lblText1.isHidden = false
            lblText2.isHidden = false
            btnTry.isHidden = false
            if (usemystatusbarbackgroundcolor)
            {
                self.statusbarView.backgroundColor = .white
                view.backgroundColor = .white
            }
            
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        
        let response = navigationResponse.response as? HTTPURLResponse
        guard let responseURL = response?.url else {
            decisionHandler(.allow)
            return
        }
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: response?.allHeaderFields as? [String : String] ?? [String : String](), for: responseURL)
        for cookie: HTTPCookie in cookies {
            HTTPCookieStorage.shared.setCookie(cookie)
        }
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        
        let requestURL = navigationAction.request.url!
        
        if (uselocalhtmlfolder) {
            if (requestURL.scheme! == "http") || (requestURL.scheme! == "https") || (requestURL.scheme! == "mailto") && (navigationAction.navigationType == .linkActivated)
            {
                if (openallexternalurlsinsafaribydefault && !deeplinkingrequest) {
                   deeplinkingrequest = false
                    self.open(scheme: requestURL)
                    
                    decisionHandler(.cancel)
                    return
                }
            }
            else
            {
                decisionHandler(.allow)
                return
            }
        }
        
        
        if InternetConnectionManager.isConnectedToNetwork(){
           
            
            if requestURL.absoluteString.hasPrefix("fb://")
                    {
                        loadingSign.stopAnimating()
                        self.loadingSign.isHidden = true
                        UIApplication.shared.openURL(requestURL)
                        decisionHandler(.cancel)
                        return
                        
            }
            
                    //1
                    if navigationAction.targetFrame == nil
                    {
                        self.safariWebView = SFSafariViewController(url: requestURL)
                        self.present(self.safariWebView, animated: true, completion: nil)
                    }
                    
                    if let urlScheme = requestURL.scheme {
                        if urlScheme == "mailto" || urlScheme == "tel" || urlScheme == "maps" || urlScheme == "sms"{
                            if UIApplication.shared.canOpenURL(requestURL) {
                                self.open(scheme: requestURL)
                                decisionHandler(.cancel)
                                return
                            }
                        }
                    }
                    
                    //2
                    if requestURL.absoluteString.hasPrefix("savethisimage://?url=")
                    {
                        let imageURL = requestURL.absoluteString.substring(from: requestURL.absoluteString.index(requestURL.absoluteString.startIndex, offsetBy: "savethisimage://?url=".count))
                        self.downloadImageAndSave(toGallary: imageURL)
                        loadingSign.stopAnimating()
                        self.loadingSign.isHidden = true
                        
                        decisionHandler(.cancel)
                        return
                    }
                    
                    //3
                    func ShareBtnAction(message: String)
                          {
                              print(message)
                              let message1 = message.replacingOccurrences(of: "%20", with: " ", options: NSString.CompareOptions.literal, range: nil)
                              let textToShare = message1
                              let message = message1
                            var sharingURL = ""
                              if let link = NSURL(string: sharingURL)
                              {
                                  let objectsToShare = [message,link] as [Any]
                                  let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                                  activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
                                  self.present(activityVC, animated: true, completion: nil)
                              }
                          }
                    

                    if requestURL.absoluteString.prefix(11).hasPrefix("shareapp://"){
                        let sharetext = requestURL.absoluteString
                        let newmeg = sharetext.dropFirst(22)
                        print(newmeg)
                        ShareBtnAction(message: "\(newmeg)")
                        decisionHandler(.cancel)
                        return
                        
                    }
                    
                    
                    if requestURL.absoluteString.hasPrefix("inapppurchase://"){
                        if (extendediap){
                                showActions(str: "\(requestURL.absoluteString.description)")
                                decisionHandler(.cancel)
                                return
                        }
                        else{
                            let textiap = "UGxlYXNlIHVwZ3JhZGUgeW91ciBSZWd1bGFyIExpY2Vuc2UgdG8gYW4gRXh0ZW5kZWQgTGljZW5zZSB0byB1c2UgZmVhdHVyZXMgdGhhdCByZXF1aXJlIHlvdXIgdXNlcnMgdG8gcGF5LiBUaGlzIGlzIHJlcXVpcmVkIGJ5IHRoZSBDb2RlQ2FueW9uL0VudmF0byBNYXJrZXQgbGljZW5zZSB0ZXJtcy4gWW91IGNhbiByZXVzZSB5b3VyIGxpY2Vuc2UgZm9yIGFub3RoZXIgcHJvamVjdCBPUiByZXF1ZXN0IGEgcmVmdW5kIGlmIHlvdSB1cGdyYWRlLiBWaXNpdCB3d3cud2Vidmlld2dvbGQuY29tL3VwZ3JhZGUtbGljZW5zZSBmb3IgbW9yZSBpbmZvcm1hdGlvbi4="
                            let textiap2 = "T0s="
                            let textiap3 = "TGVhcm4gbW9yZQ=="
                            let textiap4 = "aHR0cHM6Ly93d3cud2Vidmlld2dvbGQuY29tL3VwZ3JhZGUtbGljZW5zZS8="
                                
                                let alertController = UIAlertController(title: textiap.base64Decoded(), message: nil, preferredStyle: UIAlertController.Style.alert)
                                
                            alertController.addAction(UIAlertAction(title: textiap2.base64Decoded(), style: .default, handler: { (action: UIAlertAction!) in
                                      }))
                            alertController.addAction(UIAlertAction(title: textiap3.base64Decoded(), style: .cancel, handler: { (action: UIAlertAction!) in
                                let url = URL (string: textiap4.base64Decoded()!)
                                self.open(scheme: url!)
                                      }))
                            
                                DispatchQueue.main.async {
                                    self.present(alertController, animated: true, completion: nil)
                                }
                           
                                decisionHandler(.cancel)
                                return
                        }
                    }
                    
                    if requestURL.absoluteString.hasPrefix("inappsubscription://"){
                        if (extendediap){
                            showActions(str: "\(requestURL.absoluteString.description)")
                            decisionHandler(.cancel)
                            return
                            
                        }
                        else{
                            let textiap = "UGxlYXNlIHVwZ3JhZGUgeW91ciBSZWd1bGFyIExpY2Vuc2UgdG8gYW4gRXh0ZW5kZWQgTGljZW5zZSB0byB1c2UgZmVhdHVyZXMgdGhhdCByZXF1aXJlIHlvdXIgdXNlcnMgdG8gcGF5LiBUaGlzIGlzIHJlcXVpcmVkIGJ5IHRoZSBDb2RlQ2FueW9uL0VudmF0byBNYXJrZXQgbGljZW5zZSB0ZXJtcy4gWW91IGNhbiByZXVzZSB5b3VyIGxpY2Vuc2UgZm9yIGFub3RoZXIgcHJvamVjdCBPUiByZXF1ZXN0IGEgcmVmdW5kIGlmIHlvdSB1cGdyYWRlLiBWaXNpdCB3d3cud2Vidmlld2dvbGQuY29tL3VwZ3JhZGUtbGljZW5zZSBmb3IgbW9yZSBpbmZvcm1hdGlvbi4="
                            let textiap2 = "T0s="
                            let textiap3 = "TGVhcm4gbW9yZQ=="
                            let textiap4 = "aHR0cHM6Ly93d3cud2Vidmlld2dvbGQuY29tL3VwZ3JhZGUtbGljZW5zZS8="
                                
                                let alertController = UIAlertController(title: textiap.base64Decoded(), message: nil, preferredStyle: UIAlertController.Style.alert)
                                
                            alertController.addAction(UIAlertAction(title: textiap2.base64Decoded(), style: .default, handler: { (action: UIAlertAction!) in
                                      }))
                            alertController.addAction(UIAlertAction(title: textiap3.base64Decoded(), style: .cancel, handler: { (action: UIAlertAction!) in
                                let url = URL (string: textiap4.base64Decoded()!)
                                self.open(scheme: url!)
                                      }))
                            
                                DispatchQueue.main.async {
                                    self.present(alertController, animated: true, completion: nil)
                                }
                           
                                decisionHandler(.cancel)
                                return
                        }
                    }
            
            if requestURL.absoluteString.hasPrefix("get-uuid://"){
                let uuidString = "var uuid = \"\(Constants.kDeviceId)\";"
                webView.evaluateJavaScript(uuidString, completionHandler: nil)
                decisionHandler(.cancel)
                return
            }
                    
                    
             
                    if requestURL.absoluteString.hasPrefix("spinneron://")
                    {
                        loadingSign.isHidden = false
                       decisionHandler(.cancel)
                        loadingSign.startAnimating()
                        return
                    }
                    
                    
                    if requestURL.absoluteString.hasPrefix("spinneroff://")
                           {
                               loadingSign.isHidden = true
                           decisionHandler(.cancel)
                            return
                           }
            
                    
            
                   
                    if requestURL.absoluteString.hasPrefix("registerpush://")
                    {
                        OneSignal.promptForPushNotifications(userResponse: { accepted in
                            print("User accepted notifications: \(accepted)")
                        })
                        
                            if #available(iOS 10.0, *)
                            {
                                UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) {(accepted, error) in
                                    if !accepted {
                                        print("Notification access denied")
                                    }
                                }
                            }
                            else
                            {
                                
                            }
                        
                    decisionHandler(.cancel)
             
                     return
                    }
                    
                
                    if requestURL.absoluteString.hasPrefix("reset://")
                    {
                        URLCache.shared.removeAllCachedResponses()
                        URLCache.shared.removeAllCachedResponses()
                        let config = WKWebViewConfiguration()
                        config.websiteDataStore = WKWebsiteDataStore.nonPersistent()
                        config.allowsInlineMediaPlayback = true
                        config.mediaTypesRequiringUserActionForPlayback = []
                        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
                        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
                            records.forEach { record in
                                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                            }
                        }
                        
                        let webView = WKWebView(frame: .zero, configuration: config)
                        let alert = UIAlertController(title: "App reset was successful", message: "Thank you.", preferredStyle: UIAlertController.Style.alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                        webView.reload()
                        decisionHandler(.cancel)
                        return
                        
                    }
                    
             
                    if ((requestURL.host != nil) && requestURL.host! == "push.send.cancel")
                    {
                        UIApplication.shared.cancelAllLocalNotifications()
                        
                        decisionHandler(.cancel)
                        return
                    }
                    
                 
                    if ((requestURL.host != nil) && requestURL.host! == "push.send")
                    {
                        let prerequest = requestURL
                        let finished = prerequest.absoluteString
                        var requested = finished.components(separatedBy: "=")
                        let seconds = requested[1]
                        var logindetails = finished.components(separatedBy: "msg!")
                        let logindetected = logindetails[1]
                        var logindetailsmore = logindetected.components(separatedBy: "&!#")
                        let msg0 = logindetailsmore[0]
                        let button0 = logindetailsmore[1]
                        let msg = msg0.replacingOccurrences(of: "%20", with: " ")
                        let button = button0.replacingOccurrences(of: "%20", with: " ")
                        let sendafterseconds: Double = Double(seconds)!
                        
                        if #available(iOS 10.0, *)
                        {
                            let action = UNNotificationAction(identifier: "buttonAction", title: button, options: [])
                            let category = UNNotificationCategory(identifier: "localNotificationTest", actions: [action], intentIdentifiers: [], options: [])
                            UNUserNotificationCenter.current().setNotificationCategories([category])
                            
                            let notificationContent = UNMutableNotificationContent()
                            notificationContent.body = msg
                            notificationContent.sound = UNNotificationSound.default
                            
                            let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: sendafterseconds, repeats: false)
                            
                            let localNotificationRequest = UNNotificationRequest(identifier: "localNotificationTest", content: notificationContent, trigger: notificationTrigger)
                            
                            UNUserNotificationCenter.current().add(localNotificationRequest) {(error) in
                                if let error = error {
                                    print("We had an error: \(error)")
                                }
                            }
                        }
                        else
                        {
                            let pushmsg1 = UILocalNotification()
                            pushmsg1.fireDate = Date().addingTimeInterval(sendafterseconds)
                            pushmsg1.timeZone = NSTimeZone.default
                            pushmsg1.alertBody = msg
                            pushmsg1.soundName = UILocalNotificationDefaultSoundName
                            pushmsg1.alertAction = button
                            UIApplication.shared.scheduleLocalNotification(pushmsg1)
                        }
                        
                        decisionHandler(.cancel)
                        return
                    }
                    
               
                   
  
                        
                        if ((requestURL.host != nil) && requestURL.absoluteString.contains(".ics"))
                                                {
                            
                            self.safariWebView = SFSafariViewController(url: requestURL)
                            self.present(self.safariWebView, animated: true, completion: nil)
                                                decisionHandler(.cancel)
                                                return
                            }
                        
                        if ((requestURL.host != nil) && requestURL.absoluteString.contains("whatsapp.com"))
                                                {
                                                loadingSign.stopAnimating()
                                                self.loadingSign.isHidden = true
                                                UIApplication.shared.openURL(requestURL)
                                                decisionHandler(.cancel)
                                                return
                            }
                        
                    
                        /* EXAMPLE: Open specific URL "http://m.facebook.com" links in Safari START */
                        
                        /* if ((requestURL.host != nil) && requestURL.host! == "m.facebook.com")
                         {
                         loadingSign.stopAnimating()
                         self.loadingSign.isHidden = true
                         UIApplication.shared.openURL(requestURL)
                         decisionHandler(.cancel)
                         return
                         }
                         */
                        
                        /* EXAMPLE: Open specific URL "http://m.facebook.com" links in Safari END */
                        
                        
                        let internalFileExtension = (requestURL.absoluteString as NSString).lastPathComponent
                        let extstr = "\(internalFileExtension.fileExtension())"
                        print(extstr)
                        
                        
                        if Constants.extentionARY.contains(extstr)
                        {
                            var localURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask
                                , true)[0]
                            localURL = localURL + "/Download." + internalFileExtension
                            let strURL = (requestURL.absoluteString as NSString).addingPercentEscapes(using: String.Encoding.utf8.rawValue)
                            
                            DispatchQueue.main.async {
                                
                                guard let url = strURL?.makeURL() else{
                                    return
                                }
                                
                                self.load(url: url, to: URL.init(fileURLWithPath: localURL), completion: {
                                    
                                    let objectsToShare =  NSURL.init(fileURLWithPath: localURL)
                                    let activityVC = UIActivityViewController(activityItems: [objectsToShare], applicationActivities: nil)
                                    
                                    if UIDevice.current.userInterfaceIdiom == .pad
                                    {
                                        activityVC.popoverPresentationController?.sourceView = self.view
                                        let popover = UIPopoverController(contentViewController: activityVC)
                                        DispatchQueue.main.async {
                                            popover.present(from:  CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4, width: 0, height: 0), in: self.view, permittedArrowDirections: .any, animated: true)
                                        }
                                    }
                                    else
                                    {
                                        DispatchQueue.main.async {
                                            self.present(activityVC, animated: true, completion: nil)
                                        }
                                    }
                                })
                            }
                            decisionHandler(.cancel)
                        }
                        else{
                            decisionHandler(.allow)
                        }
                        
                      
                    
                    func qrbuttonaction()
                    {
                        let scanner = QRCodeScannerController.init()
                        //let scanner = QRCodeScannerController(cameraImage: UIImage(named: "camera"), cancelImage: UIImage(named: "cancel"), flashOnImage: UIImage(named: "flash-on"), flashOffImage: UIImage(named: "flash-off"))
                       // scanner.delegate = self
                        scanner.modalPresentationStyle = .fullScreen
                        self.present(scanner, animated: true, completion: nil)
                    }
                    if requestURL.absoluteString.hasPrefix("qrcode://"){
                        print("print")
                        qrbuttonaction()
                        //decisionHandler(.cancel)
                        loadingSign.isHidden = true
                        return
                        
                    }
                    
                    
                    
                   
                    if (requestURL.host != nil) && !(host == requestURL.host!) && (navigationAction.navigationType == .linkActivated) && openallexternalurlsinsafaribydefault && !deeplinkingrequest {
            
                        ///BEGIN WHITELIST
                        if requestURL.absoluteString.hasPrefix("https://www.jocapps.com")
                               {
                        }
                       ///WHITELIST -> COPY FROM HERE FOR EACH DOMAIN
                        else if requestURL.absoluteString.hasPrefix("https://bing.com")
                               {
                        }
                        ///WHITELIST -> BEGIN WHITE LAST // COPY UNTIL HERE FOR EACH DOMAIN
            
            
                        else {
                        deeplinkingrequest = false
                        self.open(scheme: requestURL)
                        loadingSign.stopAnimating()
                        self.loadingSign.isHidden = true
                        return
                        }
                    }
        }else{
            
             if Constants.offlinelocalhtmlswitch == true {
                           if (offlineswitchcount < 2){
                               usemystatusbarbackgroundcolor = false
                               statusbarbackgroundcolor = first_statusbarbackgroundcolor
                               statusbarView.backgroundColor = statusbarbackgroundcolor
                               decisionHandler(.cancel)
                                  bgView.isHidden = true
                               statusbarView.isHidden = false
                                  webView.stopLoading()
                                  let url = Bundle.main.url(forResource: "index", withExtension:"html")
                                  webView.load(URLRequest(url: url!))
                                      offlineswitchcount = 2
                                  return
                                      
                                  }
                                  else {
                                      offlineswitchcount = 1
                                      decisionHandler(.allow)
                                      return
                                  }
                           
                       } else{
                offlineImageView.isHidden = false
                webView.isHidden = true
                bgView.isHidden = true
                lblText1.isHidden = false
                lblText2.isHidden = false
                btnTry.isHidden = false
                loadingSign.isHidden = true
                if (usemystatusbarbackgroundcolor)
                {
                    self.statusbarView.backgroundColor = .white
                    view.backgroundColor = .white
                }
            }
            decisionHandler(.cancel)
        }
      
        
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    func loadHtmlFile() {
        if #available(iOS 13.0, *) {
            let vc = self.storyboard?.instantiateViewController(identifier: "LoadindexpageVC") as! LoadindexpageVC
            self.present(vc, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoadindexpageVC") as! LoadindexpageVC
             self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
}
extension WebViewController: QRScannerCodeDelegate {
    func qrCodeScanningDidCompleteWithResult(result: String) {
        
    }
    
    func qrCodeScanningFailedWithError(error: String) {
        
    }
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        print("result:\(result)")
        loadingSign.isHidden = true
        if verifyUrl(urlString: "\(result)") == true {
            
            if (qrcodelinks == "0"){ //Open QR Code links in the Main WebView window
                let url = URL (string: result)
                let requestObj = URLRequest(url: url!)
                webView.load(requestObj)
            }
            
            if (qrcodelinks == "1"){ //Open QR Code links in a new popup
                let urlqr = URL (string: result)
                self.safariWebView = SFSafariViewController(url: urlqr!)
                self.present(self.safariWebView, animated: true, completion: nil)
            }
            if (qrcodelinks == "2"){ //Open QR Code links in the Safari Browser
                let url = URL (string: result)
                self.open(scheme: url!)
            }
        
            
            
            
            
        }
        
        
        
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        print("error:\(error)")
    }
    func qrScannerDidCancel(_ controller: UIViewController) {
        print("SwiftQRScanner did cancel")
        loadingSign.isHidden = true
        //return
    }
}

extension WebViewController
{
    private func addWebViewToMainView(_ webView: WKWebView)
    {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        print(UIScreen.main.nativeBounds.height)
        switch UIScreen.main.nativeBounds.height {
    
        case 1624:
       
            view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 25))
            if showBannerAd {
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: -66))
            }else{
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: 0))
                
            }
        case 2436,2688,1792:
            if (bigstatusbar)
                           {
            view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 45))
            }
            else{
                  view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 32))
            }
            if showBannerAd {
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: -66))
            }else{
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: 0))

            }
            case 1334,2208:
                       if (bigstatusbar)
                                      {
                       view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 35))
                       }
                       else{
                             view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 21))
                       }
                       if showBannerAd
                       {
                           view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: -44))
                           
                       }
                       else
                       {
                           view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: 0))
                       }
            
        default:
            
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                if (bigstatusbar)
                {
                    view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 40))
                }else{
                    view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 25))
                }
            case .unspecified:
                break
            case .pad:
                if (bigstatusbar)
                {
                    view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 40))
                }else{
                    view.addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 22))
                }

            case .tv:
                break
            case .carPlay:
                break
            case .mac:
                break
            @unknown default:
                break
            }
            
            if showBannerAd
            {
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: -44))
                
            }
            else
            {
                view.addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem:view, attribute: .bottom, multiplier: 1, constant: 0))
            }
        }
        
        view.addConstraint(NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant:0))
        view.layoutIfNeeded()
        webView.isHidden = true
        self.view.bringSubviewToFront(bannerView)
    }
}

extension WebViewController: WKUIDelegate
{
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let urllocal = navigationAction.request.url
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        self.safariWebView = SFSafariViewController(url: urllocal!)
        self.present(self.safariWebView, animated: true, completion: nil)
        return nil
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: Constants.kAppDisplayName, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: okbutton, style: .default, handler: { (action) in
            completionHandler()
        }))
        
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: Constants.kAppDisplayName, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: okbutton, style: .default, handler: { (action) in
            completionHandler(true)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            completionHandler(false)
        }))
        
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alertController = UIAlertController(title: Constants.kAppDisplayName, message: prompt, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.text = defaultText
            textField.placeholder = "Enter here..."
        }
        
        alertController.addAction(UIAlertAction(title: okbutton, style: .default, handler: { (action) in
            if let text = alertController.textFields?.first?.text {
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
            
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            
            completionHandler(nil)
            
        }))
        
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        if #available(iOS 11.0, *) {
            positionBannerViewFullWidthAtBottomOfSafeArea(bannerView)
        }
        else {
            positionBannerViewFullWidthAtBottomOfView(bannerView)
        }
    }
    
    @available (iOS 11, *)
    func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView) {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
            guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
            guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
            ])
    }
    
    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: bottomLayoutGuide,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 0))
    }
}


fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
    return input.rawValue
}


fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}


extension WebViewController {

    func alertWithTitle(_ title: String, message: String) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }

    func showAlert(_ alert: UIAlertController) {
        guard self.presentedViewController != nil else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }

    func alertForProductRetrievalInfo(_ result: RetrieveResults) -> UIAlertController {

        if let product = result.retrievedProducts.first {
            let priceString = product.localizedPrice!
            return alertWithTitle(product.localizedTitle, message: "\(product.localizedDescription) - \(priceString)")
        } else if let invalidProductId = result.invalidProductIDs.first {
            return alertWithTitle("Could not retrieve product info", message: "Invalid product identifier: \(invalidProductId)")
        } else {
            let errorString = result.error?.localizedDescription ?? "Unknown error. Please test on real devices (no simulators) or contact support."
            return alertWithTitle("Could not retrieve product info", message: errorString)
        }
    }

    // swiftlint:disable cyclomatic_complexity
    func alertForPurchaseResult(_ result: PurchaseResult) -> UIAlertController? {
        switch result {
        case .success(let purchase):
            print("Purchase Success: \(purchase.productId)")
            return nil
        case .error(let error):
            print("Purchase Failed: \(error)")
            switch error.code {
            case .unknown: return alertWithTitle("Purchase failed", message: error.localizedDescription)
            case .clientInvalid: // client is not allowed to issue the request, etc.
                return alertWithTitle("Purchase failed", message: "Not allowed to make the payment")
            case .paymentCancelled: // user cancelled the request, etc.
                return nil
            case .paymentInvalid: // purchase identifier was invalid, etc.
                return alertWithTitle("Purchase failed", message: "The purchase identifier was invalid")
            case .paymentNotAllowed: // this device is not allowed to make the payment
                return alertWithTitle("Purchase failed", message: "The device is not allowed to make the payment")
            case .storeProductNotAvailable: // Product is not available in the current storefront
                return alertWithTitle("Purchase failed", message: "The product is not available in the current storefront")
            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
                return alertWithTitle("Purchase failed", message: "Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
                return alertWithTitle("Purchase failed", message: "Could not connect to the network")
            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
                return alertWithTitle("Purchase failed", message: "Cloud service was revoked")
            default:
                return alertWithTitle("Purchase failed", message: (error as NSError).localizedDescription)
            }
        }
    }

    func alertForRestorePurchases(_ results: RestoreResults) -> UIAlertController {

        if results.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(results.restoreFailedPurchases)")
            return alertWithTitle("Restore failed", message: "Unknown error. Please test on real devices (no simulators) or contact support.")
        } else if results.restoredPurchases.count > 0 {
            print("Restore Success: \(results.restoredPurchases)")
            return alertWithTitle("Purchases Restored", message: "All purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle("Nothing to restore", message: "No previous purchases were found")
        }
    }

    func alertForVerifyReceipt(_ result: VerifyReceiptResult) -> UIAlertController {

        switch result {
        case .success(let receipt):
            print("Verify receipt Success: \(receipt)")
            return alertWithTitle("Receipt verified", message: "Receipt verified remotely")
        case .error(let error):
            print("Verify receipt Failed: \(error)")
            switch error {
            case .noReceiptData:
                return alertWithTitle("Receipt verification", message: "No receipt data. Try again.")
            case .networkError(let error):
                return alertWithTitle("Receipt verification", message: "Network error while verifying receipt: \(error)")
            default:
                return alertWithTitle("Receipt verification", message: "Receipt verification failed: \(error)")
            }
        }
    }

    func alertForVerifySubscriptions(_ result: VerifySubscriptionResult, productIds: Set<String>) -> UIAlertController {

        switch result {
        case .purchased(let expiryDate, let items):
            print("\(productIds) is valid until \(expiryDate)\n\(items)\n")
            return alertWithTitle("Product is purchased", message: "Product is valid until \(expiryDate)")
        case .expired(let expiryDate, let items):
            print("\(productIds) is expired since \(expiryDate)\n\(items)\n")
            return alertWithTitle("Product expired", message: "Product is expired since \(expiryDate)")
        case .notPurchased:
            print("\(productIds) has never been purchased")
            return alertWithTitle("Not purchased", message: "This product has never been purchased")
        }
    }

    func alertForVerifyPurchase(_ result: VerifyPurchaseResult, productId: String) -> UIAlertController {

        switch result {
        case .purchased:
            print("\(productId) is purchased")
            return alertWithTitle("Product is purchased", message: "Product will not expire")
        case .notPurchased:
            print("\(productId) has never been purchased")
            return alertWithTitle("Not purchased", message: "This product has never been purchased")
        }
    }
}
