//
//  HomeScreenView.swift
//  JobHunt
//
//  Created by Ankush Shandil on 05/07/25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack(spacing: 20) {

            // Top Greeting and Profile
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Text("Ankush Shandil")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.indigo)
                }

                Spacer()

                Image("icon_Girl")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            .padding(.horizontal)

            // Begin Scrollable Content
            ScrollView {
                VStack(spacing: 20) {
                    // Promo Banner
                    ZStack {
                        // Banner background
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(height: 140)

                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("50% off")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                Text("take any courses")
                                    .font(.subheadline)
                                    .foregroundColor(.white)

                                Button(action: {}) {
                                    Text("Join Now")
                                        .font(.subheadline)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }

                            Spacer()
                        }
                        .padding(.leading)
                        

                        Image("icon_Girl")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .offset(x: 90, y: 10)
                            
                            
                    }
                    .padding(.horizontal)



                    // Job Categories
                    VStack(alignment: .leading) {
                        Text("Find Your Job")
                            .font(.headline)
                        HStack(spacing: 16) {
                            JobCategoryCard(title: "Remote Job", count: "44.5k", color: .blue, icon: "doc.text")
                            VStack(spacing: 16) {
                                JobCategoryCard(title: "Full Time", count: "66.8k", color: .purple, icon: "clock.fill")
                                JobCategoryCard(title: "Part Time", count: "38.9k", color: .orange, icon: "clock")
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Recent Job List
                    HStack {
                        Text("Recent Job List")
                            .font(.headline)
                        Spacer()
                        Text("See More")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                    .padding(.horizontal)

//                    JobItemView(
//                        logo: "globe",
//                        title: "Product Designer",
//                        location: "California, USA",
//                        salary: "$15K / Mo",
//                        tags: ["Product Designer", "Full Time"]
//                    )
                    VStack(spacing: 16) {
                        ForEach(jobList) { job in
                            JobItemView(
                                logo: job.logo,
                                title: job.title,
                                location: job.location,
                                salary: job.salary,
                                tags: job.tags
                            )
                        }
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 100)
                }
            }

            // Bottom Tab Bar
            HStack {
                Spacer()
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "bell")
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.indigo)
                        .frame(width: 50, height: 50)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
                Spacer()
                Image(systemName: "bubble.left")
                Spacer()
                Image(systemName: "bookmark")
                Spacer()
            }
            .padding()
            .background(Color.white.shadow(radius: 4))
        }
    }
}

struct JobCategoryCard: View {
    var title: String
    var count: String
    var color: Color
    var icon: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            Text(count)
                .font(.title2)
                .fontWeight(.bold)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 130, height: 100)
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

struct JobItemView: View {
    var logo: String
    var title: String
    var location: String
    var salary: String
    var tags: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Top row: Logo, Job Title, Location, Salary, Bookmark
            HStack(alignment: .top) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text(salary)
                        .font(.subheadline)
                        .fontWeight(.bold)

                    Button(action: {}) {
                        Image(systemName: "bookmark")
                    }
                }
            }

            // Tag and Apply row
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                }

                Spacer()

                Button(action: {}) {
                    Text("Apply")
                        .font(.caption)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.red.opacity(0.1))
                        .foregroundColor(.red)
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .frame(minHeight: 160) // Ensures visible height
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.2), lineWidth: 0.8)
        )
    }
}

#Preview {
    HomeScreenView()
}




struct Job: Identifiable {
    let id = UUID()
    let logo: String
    let title: String
    let location: String
    let salary: String
    let tags: [String]
}

let jobList: [Job] = [
    Job(logo: "globe", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    Job(logo: "globe", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    Job(logo: "globe", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    Job(logo: "globe", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    // Repeat or generate more entries...
]

