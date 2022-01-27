//
//  Experiment.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI

struct Experiment: View {
    @State var toggleCoin: Bool = true

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }

    func toggleLastSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleLastSidebar(_:)), with: nil)
    }

    var body: some View {
        NavigationView {
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
                VStack {
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
        .navigationViewStyle(.columns)
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

struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment()
    }
}
