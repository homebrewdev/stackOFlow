//
//  AppDelegate.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 03/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//
import UIKit
// хранилище данных
var store = Store(titles: [""], autors: [""], creationDates: [], links: [""], scores: [])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

