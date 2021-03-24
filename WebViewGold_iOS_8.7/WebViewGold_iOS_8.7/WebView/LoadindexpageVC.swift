//  OnlineAppCreator.com
//  WebViewGold for iOS // webviewgold.com

import UIKit
import WebKit
class LoadindexpageVC: UIViewController {

    @IBOutlet weak var webviewWV: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let url = Bundle.main.url(forResource: "index", withExtension:"html")
        let request = URLRequest(url: url!)
        webviewWV.load(request) //loadRequest(request)
    }
    

}
