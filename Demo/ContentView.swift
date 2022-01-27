//
//  ContentView.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/24.
//

import SwiftUI

struct A: View {
    let color: Color

    var body: some View {
        GeometryReader {proxy in
            Rectangle()
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundColor(color)
                .overlay(alignment: .topLeading) {
                    Text("(height: \(proxy.size.height.description), width: \(proxy.size.width.description)")
                }
        }
    }
}

struct ContentView: View {
    @State var toggleOverlay: Bool = false

    func toggleOverlayView() {
        withAnimation {
            toggleOverlay.toggle()
        }
    }

    var body: some View {
        NavigationView {
            Text("Navigation")
                .frame(minWidth: 300)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button {
                            withAnimation {
                                toggleOverlay.toggle()
                            }
                        } label: {
                            Image(systemName: "sidebar.right")
                        }
                    }
                }
            A(color: .yellow)
                .overlay(alignment: .topLeading) {
                    VStack{
                        Spacer()
                        Button {
                            toggleOverlayView()
                        } label: {
                            if toggleOverlay {
                                Text("Hide")
                                    .animation(.none, value: toggleOverlay)
                            } else {
                                Text("Show")
                                    .animation(.none, value: toggleOverlay)
                            }
                        }
                        .background(.black)
                    }
                }
                .overlay(alignment: .trailing) {
                    if toggleOverlay {
                        HSplitView {
                            Spacer()
                            GeometryReader { proxy in
                                A(color: .blue)
                                    .frame(idealWidth: 300)
                            }
                        }
                        .transition(.move(edge: .trailing))
                    }
                }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    withAnimation{
                        toggleSidebar()
                    }
                } label: {
                    Image(systemName: "sidebar.left")
                }
            }
        }
    }

    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 1200, height: 800, alignment: .center)
    }
}
