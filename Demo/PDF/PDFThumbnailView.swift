//
//  PDFThumbnailView.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI
import PDFKit

struct PDFThumbnailView: NSViewRepresentable {
    private let document: PDFDocument?
    
    typealias NSViewType = PDFKit.PDFThumbnailView
    
    private let pdfView: PDFKit.PDFView
    
    public init(url: URL) {
        self.document = PDFDocument(url: url)
        self.pdfView = PDFThumbnailView.makePdfView(document: self.document)
    }
    
    public init(data: Data) {
        self.document = PDFDocument(data: data)
        self.pdfView = PDFThumbnailView.makePdfView(document: self.document)
    }
    
    private static func makePdfView(document: PDFDocument?) -> PDFKit.PDFView {
        let pdfView = PDFKit.PDFView()
        
        pdfView.document = document
        
        return pdfView
    }
    
    func makeNSView(context: Context) -> PDFKit.PDFThumbnailView {
        let view = PDFKit.PDFThumbnailView()
        view.pdfView = self.pdfView
        view.maximumNumberOfColumns = 1
        view.thumbnailSize.width = 100
        view.thumbnailSize.height = 150
        view.autoresizingMask = [.width, .height]
        return view
    }
    
    func updateNSView(_ nsView: PDFKit.PDFThumbnailView, context: Context) {
        nsView.pdfView = self.pdfView
    }
}

struct PDFThumbnailView_Previews: PreviewProvider {
    static let fileUrl = "/Users/shunjie.dsj/Downloads/Differential Dataflow.pdf"
    
    static var previews: some View {
        
        SplitView{
            PDFThumbnailView(url: .init(fileURLWithPath: fileUrl))
                .frame(maxWidth: 300)
        
            PDFView(url: .init(fileURLWithPath: fileUrl))
                .introspectPDFView { pdfView in
                    pdfView.displaysPageBreaks = true
                    pdfView.pageBreakMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(idealWidth: 592, maxWidth: 1024, idealHeight: 842, maxHeight: 1024, alignment: .center)
    }
}
