//
//  EventsView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 13){
                    HStack{
                        Text("Events")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 3)
                        Spacer()
                    }
                    .frame(width: screen.width - 60)
                    .padding(.top, 17)
                    .padding(.bottom, 10)

                    NavigationLink(destination: Color.white) {
                        VStack(alignment: .leading, spacing: 9){
                            Text("September 13th, 2020")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .fontWeight(.light)
                                .padding(.bottom, 7)
                                .padding(.leading, 3)
                        EventsCardView(name: "Study Groups", description: "Meet study buddies!", time: "9:00 PM - 10:00 PM", numberAttending: "20", highlightColor: Color(#colorLiteral(red: 0.8705882353, green: 0.2, blue: 0.2, alpha: 0.2)))
                                .padding(.bottom, 13)
                        }
                    }
                    NavigationLink(destination: Color.white) {
                        VStack(alignment: .leading, spacing: 9){
                            Text("September 16th, 2020")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .fontWeight(.light)
                                .padding(.bottom, 7)
                                .padding(.leading, 3)
                            EventsCardView(name: "XBOX Gaming Tournament", description: "Join video game tournaments!", time: "9:00 PM - 10:00 PM", numberAttending: "100", highlightColor: Color(#colorLiteral(red: 0.2745098039, green: 0.9333333333, blue: 0.1098039216, alpha: 0.2)))
                                .padding(.bottom, 13)
                        }
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .frame(width: screen.width)
                .background(Color.white
                .edgesIgnoringSafeArea(.bottom)
                )
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading:
                HStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                        .padding(.bottom, 3)
                }
            .frame(width: screen.width))
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}

struct EventsCardView: View {
    var name:String!
    var description:String!
    var time:String!
    var numberAttending:String!
    var highlightColor:Color!
    var body: some View {
        ZStack(alignment: .leading){
            //Description - profile images and names
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(numberAttending) people attending")
                    .font(.system(size: 13, weight: .light, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(description)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color.black)
            }
            .frame(width: 270)
            .padding(.vertical, 30)
            .padding(.leading, 40)
            HStack {
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 15)
            }
        }
        .frame(width: screen.width - 60, height: 130)
        .background(
            ZStack {
                Color.white
                HStack {
                    GroupCardHighlightView(highlightColor: highlightColor)
                    Spacer()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous)).padding(.all, 3).shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4))
    }
}

struct Event {
    var name:String!
    var description:String!
    var time:String!
    var numberAttending:String!
}
