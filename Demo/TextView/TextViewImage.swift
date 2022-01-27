//
//  TextViewImage.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

import SwiftUI

struct TextViewImage: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Given Name",
                text: $givenName
            )
                .disableAutocorrection(true)
            TextField(
                "Family Name",
                text: $familyName
            )
                .disableAutocorrection(true)
        }
        .textFieldStyle(.roundedBorder)
    }
}

struct TextViewImage_Previews: PreviewProvider {
    static var previews: some View {
        TextViewImage()
    }
}
