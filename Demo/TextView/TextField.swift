//
//  TextField.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI
import AppKit

struct TTextField: NSViewRepresentable {
    @Binding var text: String
    
    typealias NSViewType = NSTextField
    
    class Coordinator: NSObject, NSTextFieldDelegate {
        let parent: TTextField
        
        init(parent: TTextField) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeNSView(context: Context) -> NSTextField {
        let nsView = NSTextField()
        
        return nsView
    }
    
    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.delegate = context.coordinator
//        nsView.backgroundColor = .clear
        nsView.isBordered = true
        nsView.isEditable = true
        nsView.isBezeled = false
        nsView.allowsEditingTextAttributes = true
        
        let image = NSImage(systemSymbolName: "sidebar.left", accessibilityDescription: nil)
        let att = NSTextAttachment()
        att.image = image
//        att.bounds = NSRect(origin: .zero, size: (att.image?.size)!)
//        att.attachmentCell = NSTextAttachmentCell(imageCell: image)
        let s = NSAttributedString(attachment: att)
        
//        nsView.placeholderAttributedString = s
        nsView.attributedStringValue = s
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TTextField(text: .constant(""))
    }
}
