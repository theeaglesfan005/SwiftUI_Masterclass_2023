//
//  AddTodoView.swift
//  TODO
//
//  Created by Zach Bentley on 8/3/23.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    private var isButtonDisabled: Bool {
        name.isEmpty
    }
    
    // THEME
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        let todo = Todo(context: viewContext)
                        todo.name = name
                        todo.priority = priority
                        todo.id = UUID()
                            
                        do {
                            try viewContext.save()
                            //print("New todo: \(todo.name ?? "") | Priority: \(todo.priority ?? "")")
                        } catch {
                            print(error)
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                    } // SAVE BUTTON
                    .disabled(isButtonDisabled)
                } // VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
                
            } // VSTACK
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } // NAV
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AddTodoView()
}
