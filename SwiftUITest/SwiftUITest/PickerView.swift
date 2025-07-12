//
//  PickerView.swift
//  SwiftUITest
//
//  Created by JL L on 2025/05/18.
//

import SwiftUI

struct PickerView: View {
    @State private var name : String  = "2"
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Picker("Pick", selection: $0) {
                        Text("Value 1").tag(0)
                    }
                }
            }
        }
    }
}

#Preview {
    PickerView()
}
