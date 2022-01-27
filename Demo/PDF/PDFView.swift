//
//  PDFView.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI
import PDFKit

struct PDFView: NSViewRepresentable {
    private let document: PDFDocument?
    private let pdfView: PDFKit.PDFView
    
    public init(url: URL) {
        self.document = PDFDocument(url: url)
        self.pdfView = PDFView.makePdfView(document: self.document)
    }
    
    public init(data: Data) {
        self.document = PDFDocument(data: data)
        self.pdfView = PDFView.makePdfView(document: self.document)
    }
    
    private static func makePdfView(document: PDFDocument?) -> PDFKit.PDFView {
        let pdfView = PDFKit.PDFView()
        
        pdfView.document = document
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayBox = .mediaBox
        pdfView.displayDirection = .vertical
        pdfView.interpolationQuality = .high
        
        return pdfView
    }
    
    typealias NSViewType = PDFKit.PDFView
    
    class Coordinator: NSObject, PDFViewDelegate {
        var parent: PDFView
        
        init(parent: PDFView) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeNSView(context: Context) -> PDFKit.PDFView {
        pdfView
    }
    
    func updateNSView(_ pdfView: PDFKit.PDFView, context: Context) {
        pdfView.delegate = context.coordinator
    }
}

extension PDFView {
    public func introspectPDFView(customize: (PDFKit.PDFView) -> ()) -> some View {
        customize(self.pdfView)
        return self
    }
}

struct PDFView_Previews: PreviewProvider {
    static var previews: some View {
        PDFView(url: .init(fileURLWithPath: "/Users/shunjie.dsj/Downloads/Differential Dataflow.pdf"))
            .introspectPDFView { pdfView in
                pdfView.displayDirection = .vertical
                pdfView.displayBox = .mediaBox
            }
            .frame(width: 1000, height: 800, alignment: .center)
    }
}
