//
//  AppDelegate.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/5/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var homeController: HomeViewController?
    
    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let savedProjects = self.defaults.object(forKey: "projects") as? Data {
            self.homeController?.allProjects = NSKeyedUnarchiver.unarchiveObject(with: savedProjects) as! [Project]
        }
        return true
    }
    
    
    func saveProjectData(_ array: [Project]) {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: array)
        self.defaults.set(savedData, forKey: "projects")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        if let projects = homeController?.allProjects {
            saveProjectData(projects)
        } else {
            print("Error saving data to file.")
        }
    }
}

