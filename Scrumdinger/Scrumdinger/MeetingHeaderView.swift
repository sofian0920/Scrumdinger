//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Софья Норина on 6.01.2023.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int{
        secondElapsed + secondRemaining
    }
    
    private var progress: Double{
        guard totalSeconds > 0 else {return 1}
        return Double(secondElapsed) / Double(secondRemaining)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack{
            ProgressView (value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack{
                VStack(alignment: .leading){
                    Text("Second Elapsed")
                    Label("\(secondElapsed)", systemImage:  "hourglass.bottomhalf.fill")
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second  Remaining")
                    Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                        .font(.caption)
                        .labelStyle(.trailingIcon)
                }
            }
        }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            .accessibilityValue("\(minutesRemaining)")
            .padding([.top, .horizontal])
        }
    }

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: 60, secondRemaining: 180, theme: .bubblegum)
    }
}
