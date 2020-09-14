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
        ScrollView {
            VStack(alignment: .leading, spacing: 13){
                Text("Matches")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 17)
                    .padding(.bottom, 30)
                ForEach(testGroupsData, id: \.id) { group in
                    VStack(alignment: .leading, spacing: 9){
                        Text(group.date)
                           .font(.subheadline)
                           .foregroundColor(Color.gray)
                           .fontWeight(.light)
                        ConversationCardView(highlightColor: group.highlightColor, backgroundColor: group.backgroundColor, names: group.names)
                            .padding(.bottom, 13)
                    }
                }
//                ForEach(testGroupsData) { group in
//                    Text("September 13, 2020")
//                        .font(.subheadline)
//                        .foregroundColor(Color.gray)
//                        .fontWeight(.light)
//                     ConversationCardView()
//                }
            }
            .frame(width: screen.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
    }
}

let screen = UIScreen.main.bounds

struct ConversationCardView: View {
    var highlightColor:Color!
    var backgroundColor:Color!
    var names:[String]!
    var body: some View {
        ZStack {
            HStack {
                ConversationCardHighlightView(highlightColor: highlightColor)
                Spacer()
            }
            //Description - profile images and names
            VStack {
                
                Text(names.joined(separator: ", "))
                    .font(.system(size: 17, weight: .medium))
            }
        }
        .frame(width: screen.width - 60, height: 140)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
    }
}

struct ConversationCardHighlightView: View {
    var highlightColor:Color!
    var body: some View {
        VStack { Spacer() }
            .frame(height: 140)
            .frame(width: 13)
            .background(highlightColor)
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
}

let testGroupsData = [
    Group(date: "September 13st, 2020", names: ["Andy", "Richard", "Chase"], backgroundColor: Color(#colorLiteral(red: 0.8705882353, green: 0.2, blue: 0.2, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 1, green: 0.3019607843, blue: 0.3019607843, alpha: 1))),
    Group(date: "September 6th, 2020", names: ["Leo", "Lana", "Matt"], backgroundColor: Color(#colorLiteral(red: 0.2745098039, green: 0.9333333333, blue: 0.1098039216, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 0.2352941176, green: 0.4823529412, blue: 0.2745098039, alpha: 1))),
    Group(date: "August 31th, 2020", names: ["Will", "Anna", "Bill"], backgroundColor: Color(#colorLiteral(red: 0.3450980392, green: 0.3333333333, blue: 0.9333333333, alpha: 0.2)), highlightColor: Color(#colorLiteral(red: 0.3019607843, green: 0.4117647059, blue: 1, alpha: 1)))
]

