import UIKit
import WebKit

class SignupViewController: UIViewController, WKUIDelegate {
    private var webKitView: WKWebView!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webKitView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        let url = URL(string: "https://www.apple.com")!
        let request = URLRequest(url: url)
        webKitView.load(request)
        
        webKitView.uiDelegate = self
        view = webKitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSpinner()
        print("estimatedProgress before IF = \(webKitView.estimatedProgress)")
        if webKitView.estimatedProgress == 1 {
            print("estimatedProgress after IF = \(webKitView.estimatedProgress)")
            view.removeSpinner()
        }
    }
}

private extension UIView {
    func addSpinner() {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        indicatorView.startAnimating()

        addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func removeSpinner() {
        for subV in subviews {
            guard subV is UIActivityIndicatorView else { continue }
            subV.removeFromSuperview()
        }
    }
}
