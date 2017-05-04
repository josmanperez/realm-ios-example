//
//  AppDelegate.swift
//  Shopping
//
//  Created by Amit Bijlani on 10/27/16.
//  Copyright © 2016 Teamtreehouse. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        seedCategories()
        
        
        return true
    }
    
    func seedCategories() {
        do {
            let realm = try Realm()
            if realm.objects(Category.self).count == 0 {
                try Category.loadCategories(in: realm)
            }
        } catch {
            print(error)
        }
    }


}

