//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Софья Норина on 4.01.2023.
//
import Foundation
import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private  var errorWrapped: ErrorWrapped?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumView(scrums: $store.scrums) {
                                Task{
                                    do{
                                        try await ScrumStore.save(scrums: store.scrums)
                                    }catch{
                                        errorWrapped = ErrorWrapped(error: error, guidance: "Try again later.")
                                    }
                                    
                                }
                            }
                        }
                        .task {
                            do{
                                store.scrums = try await ScrumStore.load()
                            }catch{
                                errorWrapped = ErrorWrapped(error: error, guidance: "Scrumdinger will load sample data and continue")
                            }
                        }
                        .sheet(item: $errorWrapped, onDismiss: {
                            store.scrums = DailyScrum.sampleData
                        }){ wrapper in
                            ErrorView(errorWrapped: wrapper)
                        }
                    }
                    
                }
            }
     
