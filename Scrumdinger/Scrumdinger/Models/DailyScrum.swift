//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Софья Норина on 4.01.2023.
//
import Foundation
struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendes: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []

    init(id: UUID = UUID(), title: String , attendes: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendes = attendes.map{Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        
    }
}
extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
        struct Data {
            var title : String = ""
            var attendes : [Attendee] = []
            var lengthInMinutes : Double = 5
            var theme : Theme = .seafoam
        }
    var data: Data {
        Data(title: title, attendes: attendes, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    mutating func update(from data: Data) {
        title = data.title
        attendes = data.attendes
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    init(data: Data) {
        id = UUID()
        title = data.title
        attendes = data.attendes
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
   }


extension  DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendes: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendes: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendes: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
