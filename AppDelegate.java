import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var field = UITextField()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

       #if !DEBUG
       addSecuredView()
       #endif
        
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillResignActive(_ application: UIApplication) {
        field.isSecureTextEntry = false
    }

    override func applicationDidBecomeActive(
      _ application: UIApplication
    ) {
        field.isSecureTextEntry = true
    }

    private func addSecuredView() {
        if (!window.subviews.contains(field)) {
            window.addSubview(field)
            field.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            window.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(window.layer)
        }
    }
}
