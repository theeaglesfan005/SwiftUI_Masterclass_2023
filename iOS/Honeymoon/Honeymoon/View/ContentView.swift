//
//  ContentView.swift
//  Honeymoon
//
//  Created by Zach Bentley on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    @GestureState private var dragState = DragState.inactive
    
    private var dragAreaTheshold: CGFloat = 65.0
    
    let haptics = UINotificationFeedbackGenerator()
    
    // MARK: - CARD VIEWS
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    // MARK: - MOVE THE CARD
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1

        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    // MARK: - TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - DRAG STATE
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                // X MARKS THE SPOT
                                Image(systemName: "x.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width < -self.dragAreaTheshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // FOLLOW YOUR HEART
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaTheshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                    // MARK: - GESTURE
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ??
                                        .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaTheshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaTheshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaTheshold || drag.translation.width > self.dragAreaTheshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        self.haptics.notificationOccurred(.success)
                                        self.moveCards()
                                    }
                                })
                        ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
        
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        } // VSTACK
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together"),
                dismissButton: .default(Text("Happy Honeymoon"))
            )
        }
    }
}

#Preview {
    ContentView()
}
