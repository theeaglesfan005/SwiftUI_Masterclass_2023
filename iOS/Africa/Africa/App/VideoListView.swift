//
//  VideoListView.swift
//  Africa
//
//  Created by Zach Bentley on 2/23/23.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
        
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @AppStorage("listShuffled") var isListShuffled: Bool = false
    @AppStorage("listReverseSort") var isListReversed: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                //ForEach(videos.sorted { $0.name < $1.name }) { item in
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                } //: LOOP
            } //: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            // TODO: SORT BY AtoZ AS DEFAULT?
            .toolbar {
                // TODO: GIVE SORT OPTIONS ala Music app (arrow.up.arrow.down.circle)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Sort A to Z", action: {
                            videos = videos.sorted { $0.id < $1.id }
                            hapticImpact.impactOccurred()
                        })
                        Button("Sort Z to A", action: {
                            videos = videos.sorted { $1.id < $0.id }
                            isListReversed = true
                            hapticImpact.impactOccurred()
                        })
                        Button("Shuffle", action: {
                            videos = videos.shuffled()
                            isListShuffled = true
                            hapticImpact.impactOccurred()
                        })
                    } //: SORT OPTIONS
                    label: {
                        Label("Sort Options", systemImage: "arrow.up.arrow.down.circle")
                    }
                } //: TOOL BAR
            }
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
