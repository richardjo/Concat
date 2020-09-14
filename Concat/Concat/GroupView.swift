//
//  GroupView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct GroupView: View {
    var groupData: Group!
    @State var isChosen = false
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                        Text("Group")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical, 17)
                        Text("Members")
                            .font(.system(size: 21, weight: .bold))
                            .padding(.vertical, 7)
                        HStack(spacing: 9){
                            ForEach(groupData.profileImages.indices) { index in
                                GroupProfileImageView(groupData: self.groupData, index: index)
                                    .onTapGesture {
                                        self.isChosen = true
                                        print("hi")
                                    }
                                    .sheet(isPresented: self.$isChosen) {
                                        ProfileView()
                                }
                            }
                        }
                        .padding(.bottom, 13)
                    }
            
                    Text("Weekly Tasks")
                        .font(.system(size: 21, weight: .bold))

                    VStack(spacing: 17){
                        ForEach(groupData.activities.indices) { index in
                            TaskView(activity: self.groupData.activities[index])
                                .frame(height: 130)
                            
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading:
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                    .padding(.trailing, 30)
            }
            .frame(width: screen.width))
    }
}

struct TaskView: View {
    @State var isCompleted = false
    var activity: Activity!
    var body: some View {
        VStack(alignment: .leading) {
            //Description - profile images and names
            HStack {
                Image(systemName: isCompleted ? "checkmark.circle" : "circle")
                    .gesture(TapGesture()
                        .onEnded({ _ in
                            self.isCompleted.toggle()
                        }))
                    .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.1725490196, blue: 0.5137254902, alpha: 1)))
                    .padding(.trailing, 5)
                Text(activity.name)
                    .font(.system(size: 17, weight: .bold))
                Text("(5 pts)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.trailing, 13)
            .padding(.top, 13)
            .padding(.bottom, 7)
            Text(activity.description)
                .font(.system(size: 15, weight: .light))
            Spacer()
        }
        .padding(.horizontal, 19)
        .padding(.vertical, 13)
        .frame(width: screen.width - 60)
        .background(Color.white
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous)).padding(.all, 3).shadow(radius: 3))
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(groupData: testGroupsData[0])
    }
}

struct GroupProfileImageView: View {
    var groupData:Group!
    var index:Int!
    var body: some View {
        VStack {
            self.groupData.profileImages[index]
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.3), radius: 3)
        }
    }
}
