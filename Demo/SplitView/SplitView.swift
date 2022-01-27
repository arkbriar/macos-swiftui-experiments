//
//  SplitView.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/25.
//

import SwiftUI
import AppKit

extension NSSplitViewController {
    
    @IBAction open func toggleLastSidebar(_ sender: Any?) {
        if splitViewItems.count > 1 {
            let last = splitViewItems.last!
            if last.behavior == .sidebar {
                last.animator().isCollapsed = !last.isCollapsed
            }
        }
    }
}

struct SplitViewController: NSViewControllerRepresentable {

    let viewControllers: () -> [NSViewController]

    func buildSplitViewItems(controller: NSSplitViewController) {
        let viewControllers = self.viewControllers()
        for (i, viewController) in viewControllers.enumerated() {
            if (i == 0) {
                let item = NSSplitViewItem(sidebarWithViewController: viewController)
                controller.addSplitViewItem(item)
            } else {
                let item = NSSplitViewItem(viewController: viewController)
                controller.addSplitViewItem(item)
            }
        }
    }
    
    func makeNSViewController(context: Context) -> NSSplitViewController {
        let controller = NSSplitViewController()
        
        controller.splitView.isVertical = true
        controller.splitView.dividerStyle = .thin

        buildSplitViewItems(controller: controller)
        
        return controller
    }

    class Coordinator  {
        var parent: SplitViewController

        init(parent: SplitViewController) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func updateNSViewController(_ controller: NSSplitViewController, context: Context) {
        controller.splitViewItems = []

        buildSplitViewItems(controller: controller)
    }
}

struct SplitView: View {
    let splitViewController : SplitViewController
    
    init(@NSViewControllerBuilder content: @escaping () -> [NSViewController]) {
        self.splitViewController = SplitViewController(viewControllers: content)
    }
    
    var body: some View {
        self.splitViewController
    }
}

struct SplitViewExample: View {
    @State var toggleCoin: Bool = false

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }

    func toggleLastSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleLastSidebar(_:)), with: nil)
    }
    
    var body: some View {
        SplitView() {
            Text("A")
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
            //                .background(.white)
                .overlay(alignment: .topLeading) {
                    Button {
                        withAnimation {
                            toggleCoin.toggle()
                        }
                    } label: {
                        Text("Flip")
                    }
                }
            //            Text("B")
            //                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
            //                .background(.red)
            //            Text("C")
            //                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
            //                .background(.blue)
            if toggleCoin {
                HStack {
                    VStack {
                        Text("Coin ON (OPT)")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                        Text("Coin ON (OPT)")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                    }
                    Text("Coin ON (OPT)")
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                }
            }

            if toggleCoin {
                Text("Coin ON")
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
            } else {
                Text("Coin OFF")
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                    .background(.gray)
            }
            Text("D")
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
                .background(.green)
                .edgesIgnoringSafeArea(.top)
        }
        .toolbar(content: {
            ToolbarItem(placement: .automatic) {
                Button {
                    toggleSidebar()
                } label: {
                    Image(systemName: "sidebar.leading")
                }
            }

            ToolbarItems.sidebarTrackingSeparator

            ToolbarItems.flexibleSpace

            ToolbarItem(placement: .automatic) {
                Button {
                    toggleLastSidebar()
                } label: {
                    Image(systemName: "sidebar.trailing")
                }
            }
        })
    }
}

struct SplitView_Previews: PreviewProvider {
    static var previews: some View {
        SplitViewExample()
    }
}
