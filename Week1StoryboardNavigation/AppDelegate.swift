//
//  AppDelegate.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 5/30/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Launching: " + #function) //to remember the way of printing
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Launching: " + #function)

        let locator = ServiceLocator.shared
        locator.addService(service: DataProvider(count: 20))
        locator.addService(service: TimerProvider(count: 20))
        locator.addService(service: AlgoProvider())
        locator.addService(service: SuffixArrayManipulator())

        locator.addService(service: DateReplacer())
        locator.addService(service: LengthMeasureReplacer())
        locator.addService(service: FileService())

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Terminating: applicationWillResignActive") //deliberate printing
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Terminating: applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Launching: applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Launching: applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Terminating: applicationWillTerminate")
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool
    {
        if url.scheme == "ShareText"
        {
            let storyboard = UIStoryboard(name: "SharedTextParser", bundle: nil)
            if let sharedViewController = storyboard.instantiateInitialViewController() as? SharedTextParserViewController {

                let sl = ServiceLocator.shared
                let sharedTextModel = SharedTextModel(dateReplacer: sl.getService()!, measureReplacer: sl.getService()!)
                let viewModel = SharedTextViewModel(view: sharedViewController, model: sharedTextModel)
                sharedViewController.viewModel = viewModel

                let currentViewController = UIApplication.shared.keyWindow?.rootViewController?.topMostViewController()
                if let currentViewController = currentViewController {
                    currentViewController.present(sharedViewController, animated: true, completion: nil)
                }
            }

        }
        return true
    }


}

