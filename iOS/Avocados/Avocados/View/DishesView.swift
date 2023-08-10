//
//  DishesView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct DishesView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            // 1st Column
            VStack(alignment: .leading, spacing: 4) {
                HStack() {
                    Image("icon-toasts")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Toasts")
                        .modifier(TextModifier())
                }
                Divider()
                HStack() {
                    Image("icon-tacos")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Tacos")
                        .modifier(TextModifier())
                }
                Divider()
                HStack() {
                    Image("icon-salads")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Salads")
                        .modifier(TextModifier())
                }
                Divider()
                HStack() {
                    Image("icon-halfavo")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Spreads")
                        .modifier(TextModifier())
                }
            }
            
            // 2nd Column
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle").foregroundColor(Color("ColorGreenDark"))
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }
            
            // 3rd Column
            VStack(alignment: .trailing, spacing: 4) {
                HStack() {
                    Text("Guacamole")
                        .modifier(TextModifier())
                    Spacer()
                    Image("icon-guacamole")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Sandwiches")
                        .modifier(TextModifier())
                    Spacer()
                    Image("icon-sandwiches")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Soup")
                        .modifier(TextModifier())
                    Spacer()
                    Image("icon-soup")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack() {
                    Text("Smoothie")
                        .modifier(TextModifier())
                    Spacer()
                    Image("icon-smoothies")
                        .resizable()
                        .modifier(IconModifier())
                }
                
            }
        }
        .font(.system(.callout, design: .serif))
        .foregroundColor(Color.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42, alignment: .center)
            .foregroundColor(Color("ColorGreenMedium"))
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("ColorGreenLight"))
    }
}

#Preview {
    DishesView()
        .previewLayout(.fixed(width: 414, height: 280))
}
