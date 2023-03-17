//
//  Flexigram2App.swift
//  Flexigram2
//
//  Created by 有賀智貴 on 2021/09/15.
//

import SwiftUI
import Firebase

@main
struct FlexigramApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

 //       print("Firebase")
        FirebaseApp.configure()
        return true
    }

}


