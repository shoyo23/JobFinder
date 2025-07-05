//
//  CompaniesView.swift
//  JobHunt
//
//  Created by Ankush Shandil on 05/07/25.
//

import SwiftUI

struct Company: Identifiable {
    let id = UUID()
    let name: String
    let followers: String
    var isFollowing: Bool = false
}

struct CompaniesView: View {
    @State private var companies = [
        Company(name: "Google Inc", followers: "1M Followers"),
        Company(name: "Twitter Inc", followers: "1M Followers"),
        Company(name: "Facebook Inc", followers: "1M Followers"),
        Company(name: "Dribbble Inc", followers: "1M Followers"),
        Company(name: "Apple Inc", followers: "1M Followers"),
        Company(name: "Microsoft Inc", followers: "1M Followers")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach($companies) { $company in
                    CompanyCard(company: $company)
                }
            }
            .padding()
        }
    }
}

struct CompanyCard: View {
    @Binding var company: Company
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("#\(company.name)")
                    .font(.system(size: 18, weight: .semibold))
                
                Text(company.followers)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                company.isFollowing.toggle()
            }) {
                Text("Follow")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
