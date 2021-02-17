//import UIKit
//import Firebase
//import Netmera
//import UserNotifications
//import Netmera.NetmeraInbox
//import FirebaseCore
//
//
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate, NetmeraPushDelegate{
//    // Yukarıya belki , NetmeraPushDelegate eklenebilir onu dene
//    var window: UIWindow?
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        // iOS 10 ve üzeri için willPresent methodu kullanılmaktadır, media push iOS 10 ile birlikte gelmiştir.
//        // Aşağıdaki kontrolün koyulmasının sebebi iOS 10 işletim sistemi ile gelen, yeni methodların kullanmılması içindir.
//
//        // Override point for customization after application launch.
//          FirebaseApp.configure()
//
//          // For On-premise setup
//          // Netmera.setBaseURL("YOUR PANEL DOMAIN URL")
//
//          // This can be called later, see documentation for details
//
//
//           Netmera.setAPIKey("DHT7u5QcIkED0q4wmHi8eybv4J1VF2MTOlgKE3igsiQ3seM9jPc0ng")
//           Netmera.setLogLevel(NetmeraLogLevel.debug)
//
//          // Call this method with needed notification types
//
//          Netmera.requestPushNotificationAuthorization(forTypes: [.alert, .badge, .sound])
//          // * Netmera.setAppGroupName("group.com.netmera.demo")
//          // * Netmera.setPushDelegate(self)
//
//          Netmera.setEnabledPopupPresentation(true)
//
//
//          Netmera.setPushDelegate(self)
//
//          return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//
//    /*
//    func shouldHandleOpen(_ url: URL!, for object: NetmeraPushObject!) -> Bool {
//
//
//        let scheme : String? = (url.scheme)
//
//             if (scheme == "myapp") {
//
//                 let host : String? = url.host
//
//                 if(host == "sayfa1"){
//
//                     let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//                     let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MusicViewController") as! MusicViewController
//
//                     let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//                     appDelegate.window?.rootViewController = redViewController
//                 }
//
//             }
//
//
//        return true
//    } */
//
//
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        // Push'a ilk tıkladığımızda ayağa kalkan method (Payload'ı yakaladığımızda)
//
//        print("Push body = \(String(describing: Netmera.recentPushObject()?.alert.body))")
//        print("Deeplink = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURL))")
//        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
//        print("Title = \(String(describing: Netmera.recentPushObject()?.alert.title))")
//        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
//        print("Deeplink URL String = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURLString))")
//        print("Self = \(String(describing: Netmera.recentPushObject()?.action.self))")
//
//    }
//
//    /*
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
        print("Push body = \(String(describing: Netmera.recentPushObject()?.alert.body))")
        print("Deeplink = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURL))")
        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
        print("Title = \(String(describing: Netmera.recentPushObject()?.alert.title))")
        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
        print("Deeplink URL String = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURLString))")
        print("Self = \(String(describing: Netmera.recentPushObject()?.action.self))")

//
//
//        // Bildirim cihaza düştüğünde yakaladığımız method
//
//
//
//    }*/
//    /*
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//        willPresent notification: UNNotification,
//        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
//
//        // Uygulama ön planda iken push payload' u buraya düşer,
//
//        print("Push body = \(String(describing: Netmera.recentPushObject()?.alert.body))")
//        print("Deeplink = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURL))")
//        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
//        print("Title = \(String(describing: Netmera.recentPushObject()?.alert.title))")
//        print("Subtitle = \(String(describing: Netmera.recentPushObject()?.alert.subtitle))")
//        print("Deeplink URL String = \(String(describing: Netmera.recentPushObject()?.action.deeplinkURLString))")
//        print("Self = \(String(describing: Netmera.recentPushObject()?.action.self))")
//
//
//    }
//    */
//
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
//    {
//        //handle URL here to navigate to custom views
//
//        if (url.scheme == "myapp")
//        {
//            if (url.host == "deeplink")
//            {
//
//                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//                let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//                appDelegate.window?.rootViewController = redViewController
//
//                // present view controller for screenOne;
//            }
//            else if (url.host == "screenTwo")
//            {
//                // present view controller for screenTwo;
//            }
//
//            // or you can use host property directly
//        }
//
//        return true
//    }
//
//    //func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool{
//        // Deeplink bildirime tıkladığımızda gitmek istediğimiz yere yönlendirmesi
//        // Deeplink burada yakalanır.
//        // URL parametresi içerisinde Deeplink Url'ine ulaşılır.
//       /* ********************************************************
//        let scheme : String? = (url.scheme)
//        if (scheme == "myapp") {
//
//            let host : String? = url.host
//
//            if(host == "sayfa1"){
//
//                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//                let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//                appDelegate.window?.rootViewController = redViewController
//            }
//
//        }
//        * ******************************************************** */
//
//        if let scheme = url.scheme, scheme == "myapp" {
//
//            let host : String? = url.host
//
//            if(host == "sayfa1"){
//
//                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//                let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//                appDelegate.window?.rootViewController = redViewController
//            }
//
//        }
//
//        return true
//
//    }
//
//    /*
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//   */
//}
//
//
//

//
//  AppDelegate.swift
//  NetmeraSample
//
//  Created by inomera on 16.04.2020.
//  Copyright © 2020 Netmera. All rights reserved.
//

import UIKit
import Netmera
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().delegate = self

        startNetmera()
        
        return true
    }
    
    func startNetmera() {
        Netmera.start()
//        Netmera.setBaseURL("YOUR_BASE_URL")
        Netmera.setAPIKey("DHT7u5QcIkED0q4wmHi8eybv4J1VF2MTOlgKE3igsiQ3seM9jPc0ng")
        Netmera.setAppGroupName("group.com.netmera.demo")
        Netmera.setLogLevel(NetmeraLogLevel.debug)

        
        Netmera.requestPushNotificationAuthorization(forTypes: [.alert,.sound])
//        Netmera.setPushDelegate(self)
//        Netmera.setEnabledPopupPresentation(true)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Detect deeplink
        if let scheme = url.scheme, scheme == "netmeraSample" {
            // When you catch the deeplink you can access the parameters.
            // You can then do whatever you want here.
        }
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

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //TODO
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        //TODO
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}

