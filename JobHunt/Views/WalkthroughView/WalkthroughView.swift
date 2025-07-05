//
//  WalkthroughView.swift
//  JobHunt
//
//  Created by Ankush Shandil on 05/07/25.
//

import SwiftUI



struct WalkthroughView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Top Illustration
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding(.top, 40)
                
                // Title Text
                VStack(alignment: .leading, spacing: 5) {
                    Text("Find Your")
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Dream Job")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.orange)
                        .underline()
                    
                    Text("Here!")
                        .font(.system(size: 32, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Description
                Text("Explore all the most exciting job roles based on your interest and study major.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 50)
                
                // Next Button
                HStack {
                    Spacer() // Pushes the button to the right
                    Button(action: {
                        // Action for navigation
                    }) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                }
                .padding(.bottom, 40)
                .padding(.horizontal)
                
            }
        }
    }
}




#Preview {
    WalkthroughView()
}
