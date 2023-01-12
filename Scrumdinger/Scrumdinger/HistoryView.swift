//
//  HistoryView .swift
//  Scrumdinger
//
//  Created by Софья Норина on 9.01.2023.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcrint{
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String{
        ListFormatter.localizedString(byJoining: attendees.map{$0.name})
    }
}

struct HistoryView__Previews: PreviewProvider {
    static var history: History{
        History(attendees: [DailyScrum.Attendee(name: "Jon"), DailyScrum.Attendee(name: "Darls"), DailyScrum.Attendee(name: "Luis")], lengthInMinutes: 10, transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
