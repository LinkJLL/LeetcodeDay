//
//  ContentView.swift
//  SwiftUITest
//
//  Created by JL L on 2025/05/18.
//

import SwiftUI



struct ContentView: View {
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var now = Date()
    
    @State var name : String = "John"
    @State private var fullText : String = "This is some editable text..."
    @State private var password : String = "123"

    @State  private var isShowing = true
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            
            Text("测试代码")
                .bold()
                .italic()
                .underline()
                .lineLimit(2)
            Text("What time is it?:\(now,formatter: Self.dateFormatter)")
            Text("Hello ") + Text("World").bold()
            Text("Hello\nworld!").multilineTextAlignment(.leading)
            
            Label("Swift",image: "swift")
            Label("Website", systemImage: "globe")
            TextField("Name's placeholder", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextEditor(text: $fullText)
                
            SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
            
            Image("foo")
            Image(systemName: "clock.fill")
                .foregroundStyle(.red)
                .font(.title)
            Image(systemName: "clock")
                .font(Font.system(.largeTitle).bold())
                .foregroundColor(.red)
                .aspectRatio(contentMode: .fit)
            
            Button {
                print("按钮点击")
            } label: {
                Image(systemName: "clock.fill")
                Text("这是个按钮")
                Text("这是另一个个按钮")
            }
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            
            Link("这是一个链接", destination: URL.init(string: "www.baidu.com")!)
            Toggle("sasdas", isOn: $isShowing)

            NavigationView {
                NavigationLink {
                    Text("Detail")
                        .navigationTitle("Detail")
                } label: {
                    Text("Push")
                }.navigationTitle("Master")
            }
           
            NavigationView {
                Text("SwiftUI").padding()
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                                       Button {

                                       } label: {
                                           Image(systemName: "square.and.pencil")
                                       }

                                   }
                        ToolbarItem(placement: .navigationBarTrailing) {
                                       Button {

                                       } label: {
                                           Image(systemName: "square.and.pencil")
                                       }

                                   }
                    }
            }
            

            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
