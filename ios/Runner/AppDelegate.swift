import Flutter
import UIKit
import GoogleMobileAds

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["50F14E98-B0F7-4C1D-AAC8-B333A142D0A1"]
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
