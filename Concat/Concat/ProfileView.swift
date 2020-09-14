//
//  ProfileView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("RichardPlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            VStack {
                Spacer()
                ZStack(alignment: .top){
                    Color.gray
                        .opacity(0.4)
                        .frame(width: 39, height: 7)
                        .clipShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
                        .offset(y: 9)
                    ScrollView {
                        VStack(alignment: .leading){
                            Text("Richard Jo, '23")
                                .font(.system(size: 23, weight: .regular, design: .default))
                                .fontWeight(.bold)
                                .padding(.bottom, 5)
                            Text("Major: Computer Science")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 9)
                            Divider()
                            Text("Bio")
                                .font(.system(size: 19, weight: .semibold, design: .default))
                                .padding(.bottom, 9)
                            VStack(alignment: .leading){
                                ProfileInterestView(question: "Favorite fruit loop color:", answer: "Red")
                                ProfileInterestView(question: "Is cereal soup:", answer: "Yes")
                                ProfileInterestView(question: "Favorite fruit loop color:", answer: "Red")
                                ProfileInterestView(question: "Pineapple on pizza:", answer: "No")
                                ProfileInterestView(question: "Favorite show from my childhood:", answer: "Tom and Jerry")
                            }
                            
                            Text("Interests")
                                .font(.system(size: 19, weight: .semibold, design: .default))
                                .padding(.bottom, 9)
                            VStack(spacing: 5){
                                HStack { ExploreProfileInterestsView(interest: "Frisbee")
                                    ExploreProfileInterestsView(interest: "Basketball")
                                    ExploreProfileInterestsView(interest: "Running")
                                }
                            }
                            .padding(.bottom, 11)
                            Text("Contact")
                                .font(.system(size: 19, weight: .semibold, design: .default))
                                .padding(.bottom, 9)
                            Text("Instagram: richard.jo1\nNumber: 847-907-5104")
                                .font(.system(size: 15, weight: .regular, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            Spacer()
                                .frame(height: 100)
                            //Stupid offset shit
                            //                            Color.white.opacity(0)
                            //                                .frame(height: 100)
                        }
                        .padding(.horizontal, 27)
                        .padding(.top, 30)
                        .padding(.bottom, 70)
                        .frame(width: screen.width)
                    }
                }
                .frame(width: screen.width, height: screen.height / 2 + 60)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 13))
            }
        }
            //.edgesIgnoringSafeArea(.all)
            .frame(width: screen.width, height: screen.height)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ExploreProfileInterestsView: View {
    var interest: String!
    var body: some View {
        ZStack {
            Text(interest)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .light, design: .default))
        }
        .frame(width: 90, height: 19)
        .padding(.all, 5)
        .background(Color(#colorLiteral(red: 0.3058823529, green: 0.1647058824, blue: 0.5176470588, alpha: 1)).opacity(50))
        .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
        .shadow(radius: 3)
    }
}

struct ProfileInterestView: View {
    var question:String!
    var answer:String!
    var body: some View {
        HStack(alignment: .bottom, spacing: 3){
            Text(question)
                .font(.system(size: 15, weight: .regular, design: .default))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 11)
            Text(answer)
                .font(.system(size: 15, weight: .regular, design: .default))
                .fontWeight(.bold)
                .italic()
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 11)
        }
    }
}
