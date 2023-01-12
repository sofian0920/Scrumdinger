//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Софья Норина on 4.01.2023.
//

import SwiftUI

struct DetailEditView: View {
   
    @Binding var data: DailyScrum.Data
       @State private var newAttendeeName = ""
        
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $data.title)
                HStack{
                    Slider( value: $data.lengthInMinutes, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendes")){
                ForEach(data.attendes) {attendee in
                    Text(attendee.name)
                }
                .onDelete{indices in
                    data.attendes.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendes.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attend")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
