//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct RipeningStagesView: View {
    // MARK: - PROPERTY
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { item in
                            RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            } // VSTACK
        } // SCROLL
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RipeningStagesView(ripeningStages: ripeningData)
}
