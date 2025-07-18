//
//  HomeScreenView.swift
//  JobHunt
//
//  Created by Ankush Shandil on 05/07/25.
//



import SwiftUI

// Define an enum to keep track of which "tab" is currently selected
enum AppScreen {
    case home
    case companies
    case notifications
    case messages
    case bookmarks
}

struct HomeScreenView: View {
    @State private var currentScreen: AppScreen = .home

    var body: some View {
        ZStack(alignment: .top) {
            Color.indigo.ignoresSafeArea()

            VStack(spacing: 0) {
                // MARK: - Header Section (Remains the same for the Home Screen content)
                if currentScreen == .home {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Hello, Ankush 👋")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)

                                Text("Find your dream job")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.9))
                            }

                            Spacer()

                            Image("icon_Girl")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                        }
                        .padding(.horizontal)

                        HStack(spacing: 12) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                TextField("Search job title, company...", text: .constant(""))
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)

                            Button {
                                // Filter action
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.orange)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 24)
                }

                // MARK: - Scrollable Content
                Group {
                    if currentScreen == .home {
                        ZStack(alignment: .top) {
                            Color.white
                                .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                                .edgesIgnoringSafeArea(.bottom)

                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 24) {
                                    // Category Tabs
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            CategoryTab(title: "Remote", icon: "laptopcomputer")
                                            CategoryTab(title: "Full Time", icon: "clock")
                                            CategoryTab(title: "Part Time", icon: "clock.badge")
                                            CategoryTab(title: "Design", icon: "paintbrush")
                                            CategoryTab(title: "Marketing", icon: "megaphone")
                                        }
                                        .padding(.horizontal)
                                        .padding(.top)
                                    }

                                    // Recent Jobs Header
                                    HStack {
                                        Text("Recent Job List")
                                            .font(.headline)
                                        Spacer()
                                        Button {
                                            // See more action
                                        } label: {
                                            Text("See More")
                                                .foregroundColor(.blue)
                                                .font(.subheadline)
                                        }
                                    }
                                    .padding(.horizontal)

                                    // Job Cards
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
                                .padding(.top)
                            }
                        }
                        .frame(maxHeight: .infinity)
                    } else if currentScreen == .companies {
                        CompaniesView() // Your Companies View
                            .background(Color.white) // Ensure background for this view
                            .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                    } else if currentScreen == .notifications {
                        CompaniesView()
                        Text("Notifications View Content")
                            .background(Color.white)
                            .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Make it fill the space
                    } else if currentScreen == .messages {
                        Text("Messages View Content")
                            .background(Color.white)
                            .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if currentScreen == .bookmarks {
                        Text("Bookmarks View Content")
                            .background(Color.white)
                            .clipShape(RoundedCorner(radius: 15, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }

                // MARK: - Bottom Tab Bar
                HStack {
                    Spacer()
                    Button {
                        currentScreen = .home // Set screen to home
                    } label: {
                        Image(systemName: "house.fill")
                            .foregroundColor(currentScreen == .home ? .indigo : .gray) // Highlight selected
                    }
                    Spacer()
                    Button {
                        currentScreen = .notifications
                    } label: {
                        Image(systemName: "bell")
                            .foregroundColor(currentScreen == .notifications ? .indigo : .gray)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.indigo)
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        currentScreen = .messages
                    } label: {
                        Image(systemName: "bubble.left")
                            .foregroundColor(currentScreen == .messages ? .indigo : .gray)
                    }
                    Spacer()
                    Button {
                        currentScreen = .bookmarks
                    } label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(currentScreen == .bookmarks ? .indigo : .gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white.shadow(radius: 4))
            }
            .ignoresSafeArea()
        }
    }
}


// MARK: - Category Pills (Unchanged)
struct CategoryTab: View {
    var title: String
    var icon: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.indigo)
                .padding(12)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 2)

            Text(title)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

// MARK: - Job Card View (Unchanged)
struct JobItemView: View {
    var logo: String
    var title: String
    var location: String
    var salary: String
    var tags: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image("icon_Google") // Replace with actual logo logic if needed
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
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.2), lineWidth: 0.8)
        )
    }
}

// MARK: - Job Model (Unchanged)
struct Job: Identifiable {
    let id = UUID()
    let logo: String
    let title: String
    let location: String
    let salary: String
    let tags: [String]
}

// MARK: - Sample Data (Unchanged)
let jobList: [Job] = [
    Job(logo: "icon_Googl", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    Job(logo: "icon_Googl", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
    Job(logo: "icon_Googl", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),    Job(logo: "icon_Googl", title: "Product Designer", location: "California, USA", salary: "$15K / Mo", tags: ["Product Designer", "Full Time"]),
    Job(logo: "scribble.variable", title: "Software Engineer", location: "Redmond, WA", salary: "$18K / Mo", tags: ["Software Engineer", "Full Time"]),
    Job(logo: "waveform.path.ecg", title: "Data Scientist", location: "Austin, TX", salary: "$20K / Mo", tags: ["Data Scientist", "Remote"]),
]

// MARK: - Preview (Unchanged)
#Preview {
    HomeScreenView()
}

// MARK: - RoundedCorner Shape (Unchanged)
struct RoundedCorner: Shape {
    var radius: CGFloat = 15.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
