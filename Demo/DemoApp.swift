//
//  DemoApp.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/24.
//

import SwiftUI

@main
struct DemoApp: App {
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
                        Experiment()
                            .edgesIgnoringSafeArea(.top)
            //                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
            //                    hideTitleBar()
            //                })
//            SplitViewExample()
//                .edgesIgnoringSafeArea(.top)
//                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
//                    hideTitleBar()
//                })
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified(showsTitle: false))
    }
    
    func hideTitleBar() {
        for window in NSApplication.shared.windows {
            //            window.styleMask.insert(.fullSizeContentView)
            //            window.titlebarAppearsTransparent = true
            //            window.titleVisibility = .hidden
            window.titlebarSeparatorStyle = .shadow

        }
    }
    
    func hideZoomButton() {
        for window in NSApplication.shared.windows {
            window.standardWindowButton(NSWindow.ButtonType.zoomButton)!.isHidden = true
        }
    }
}
