//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Софья Норина on 9.01.2023.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapped: ErrorWrapped
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            Text(errorWrapped.error.localizedDescription)
                .font(.headline)
            Text(errorWrapped.guidance)
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Dismiss") {
                    dismiss()
                }
            }
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
        
    }
    static var wrapper: ErrorWrapped{
        ErrorWrapped(error: SampleError.errorRequired, guidance: "You can safely ignore this error")
    }
    static var previews: some View {
        ErrorView(errorWrapped: wrapper)
    }
}
