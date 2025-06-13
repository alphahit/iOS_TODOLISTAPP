//
//  AppDelegate.swift
//  SwiftStarter
//
//  Created by Prateek Priyadarshi on 09/06/25.
//



//AppDelegate.swift
//What it is:
//The “app delegate” is your app’s global lifecycle manager. It conforms to UIApplicationDelegate and receives high-level events like:
//App finished launching
//App is about to go into the background or foreground
//Low-memory warnings
//Push-notification delivery
//Key responsibilities:
//Initial setup that applies to your entire app
//Responding to system-wide events



import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

