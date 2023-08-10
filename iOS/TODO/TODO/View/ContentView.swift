//
//  ContentView.swift
//  TODO
//
//  Created by Zach Bentley on 8/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTY
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var iconSettings: IconNames
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)])
    
    private var todos: FetchedResults<Todo>
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    
    // MARK: - FUNCTIONS
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            viewContext.delete(todo)
            
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
    
    // THEME
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos) { todo in
                        HStack{
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(self.colorize(priority: todo.priority ?? "Normal"))
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        } // HSTACK
                        .padding(.vertical, 10)
                    } // FOREACH
                    .onDelete(perform: deleteTodo)
                } // LIST
                .navigationBarTitle("Todo", displayMode: .inline)
                .navigationBarItems(leading: EditButton().accentColor(themes[self.theme.themeSettings].themeColor))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingSettingsView.toggle()
                    }) {
                        Image(systemName: "paintbrush")
                    } // ADD BUTTON
                    .accentColor(themes[self.theme.themeSettings].themeColor)
                    .sheet(isPresented: $showingSettingsView) {
                        SettingsView().environmentObject(self.iconSettings)
                    }
                )
                
                // MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                }
            } // ZSTACK
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView().environment(\.managedObjectContext, viewContext)
            }
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.15 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                    }
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
                    
                    Button(action: {
                        self.showingAddTodoView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    } // BUTTON
                    .accentColor(themes[self.theme.themeSettings].themeColor)
                    .onAppear(perform: {
                        self.animatingButton.toggle()
                    })
                } // ZSTACK
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        } // NAV
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
