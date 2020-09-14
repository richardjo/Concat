//
//  ContentView.swift
//  Concat
//
//  Created by Richard Jo on 9/13/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct MatchesView: View {
    var body: some View {
        ZStack {
            ProfileInformationView()
                .padding(.top, 30)
            NavigationView {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 13){
                            Text("Matches")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.top, 17)
                                .padding(.bottom, 30)
                            ForEach(testGroupsData, id: \.id) { group in
                                NavigationLink(destination: GroupView(groupData: group)) {
                                    VStack(alignment: .leading, spacing: 9){
                                        Text(group.date)
                                           .font(.subheadline)
                                           .foregroundColor(Color.gray)
                                           .fontWeight(.light)
                                        GroupCardView(highlightColor: group.highlightColor, backgroundColor: group.backgroundColor, names: group.names, profileImages: group.profileImages)
                                            .padding(.bottom, 13)
                                    }
                                }
                            }
                            Spacer()
                                .frame(height: 100)
                        }
                        .frame(width: screen.width)
                        .background(Color.white
                        .edgesIgnoringSafeArea(.bottom)
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 1, y: 1))
                    }
                }
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}

let screen = UIScreen.main.bounds

struct GroupCardView: View {
    var highlightColor:Color!
    var backgroundColor:Color!
    var names:[String]!
    var profileImages:[Image]!
    var body: some View {
        ZStack {
            HStack {
                GroupCardHighlightView(highlightColor: highlightColor)
                Spacer()
            }
            //Description - profile images and names
            VStack(alignment: .leading){
                HStack(spacing: -9){
                    GroupCardViewProfileImages(profileImages: profileImages)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                Text("Last talked: 9:10 PM")
                    .font(.system(size: 13, weight: .light, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(names.joined(separator: ", "))
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color.black)
            }
            .padding(.leading, 30)
            .padding(.vertical, 30)
            HStack {
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 15)
            }
        }
        .frame(width: screen.width - 60, height: 140)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
    }
}

struct GroupCardHighlightView: View {
    var highlightColor:Color!
    var body: some View {
        VStack { Spacer() }
            .frame(height: 140)
            .frame(width: 13)
            .background(highlightColor)
    }
}

struct GroupCardViewProfileImages: View {
    var profileImages:[Image]!
    var body: some View {
        ForEach(profileImages.indices) { index in
            self.profileImages[index]
                .resizable()
                .renderingMode(.original)
                .frame(width: 44, height: 44)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: Color.black.opacity(0.3), radius: 3)
        }
    }
}

struct ProfileInformationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("3250")
                    .font(.title)
                    .fontWeight(.light)
                Spacer()
                Image("RichardPlaceholder")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 36)
            Spacer()
        }
    }
}


//MARK: - Test Data

struct Group {
    var id = UUID()
    var date: String!
    var names: [String]!
    var profileImages: [Image]!
    var backgroundColor: Color!
    var highlightColor: Color!
    var activities: [Activity]!
}

struct Activity {
    var name: String!
    var description: String!
}

let testGroupsData = [
    Group(date: "September 13st, 2020", names: ["Andy", "Richard", "Chase"], profileImages: [Image("port1"), Image("port2"), Image("port3")], backgroundColor: Color(#colorLiteral(red: 0.8705882353, green: 0.2, blue: 0.2, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 1, green: 0.3019607843, blue: 0.3019607843, alpha: 1)), activities: [Activity(name: "Watch the Rock", description: "Visit this livestream to see Northwestern's famed rock in real time!"), Activity(name: "Play a Game", description: "Suggestions: Skribbl.io, COD Warzone, Codenames, etc.")]),
    Group(date: "September 6th, 2020", names: ["Leo", "Lana", "Matt"], profileImages: [Image("port4"), Image("port5"), Image("port6")], backgroundColor: Color(#colorLiteral(red: 0.2745098039, green: 0.9333333333, blue: 0.1098039216, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 0.2352941176, green: 0.4823529412, blue: 0.2745098039, alpha: 1)), activities: [Activity(name: "Watch the Rock", description: "Visit this livestream to see Northwestern's famed rock in real time!")]),
    Group(date: "August 31th, 2020", names: ["Will", "Anna", "Bill"], profileImages: [Image("port7"), Image("port8"), Image("port9")], backgroundColor: Color(#colorLiteral(red: 0.3450980392, green: 0.3333333333, blue: 0.9333333333, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 0.3019607843, green: 0.4117647059, blue: 1, alpha: 1)), activities: [Activity(name: "Watch the Rock", description: "Visit this livestream to see Northwestern's famed rock in real time!")])
]
