//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Софья Норина on 4.01.2023.
//

import Foundation
import SwiftUI

struct TrailingiconlabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingiconlabelStyle {
    static var trailingIcon : Self { Self()
        
    }
}
