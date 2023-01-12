//
//  ErrorWrapped.swift
//  Scrumdinger
//
//  Created by Софья Норина on 9.01.2023.
//

import Foundation

struct ErrorWrapped: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
