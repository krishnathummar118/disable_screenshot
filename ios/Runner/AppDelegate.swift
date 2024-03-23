import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var overlayField: UITextField?
    var field = UITextField()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        setupMethodChannel()
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
    func setupMethodChannel() {
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "disable_screenshot", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler { [weak self] (call, result) in
            self?.handleMethodCall(call, result: result)
        }
    }

    func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "disableScreenshots":
            showOverlay()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    func showOverlay() {
        if (!window.subviews.contains(field)) {
            window.addSubview(field)
            field.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            window.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(window.layer)
        }
    }
    }
