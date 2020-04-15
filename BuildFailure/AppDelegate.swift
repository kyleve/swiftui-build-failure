//
//  AppDelegate.swift
//  BuildFailure
//
//  Created by Kyle Van Essen on 4/14/20.
//  Copyright © 2020 Kyle Van Essen. All rights reserved.
//

import UIKit


#if DEBUG && canImport(SwiftUI)

/// When building in Version 11.4 (11E146) on Catalina (10.15.4),
/// I hit an issue where the above `canImport(SwiftUI)` check passes, but the below
/// fails to compile with
///
/// ```
/// Use of undeclared type 'View'
/// ```
/// (etc)
///
/// So far I've only been able to reproduce this with an iPhone 5 simulator selected:
/// iPhone 5 OS 10.3.1 (14E8301)
///
/// When an iPad Pro (11-inch) (1st generation) is selected, it builds fine
/// > iPad Pro (11-inch) (1st generation) iOS 12.1 (16B91)
///
/// /// When an iPhone 6s is selected, it also builds fine
/// > iPhone 6s iOS 11.1 (15B87)
///
/// Which is weird, because SwiftUI is also not available on iOS 12 or iOS 11.
///
/// I'm guessing this means there's some weirdness in Xcode around iOS 10 and the canImport check? Or something?
///
/// Anyways...

import SwiftUI

@available(iOS 13.0, *)
public struct ElementPreview : View {
    
    public var body: some View {
        Text("Hello!")
    }
}

#endif





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()
        
        self.window = window
        
        window.makeKeyAndVisible()
        
        return true
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
