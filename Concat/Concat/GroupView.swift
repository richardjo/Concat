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
    var body: some View {
        VStack(alignment: .leading){
            Text("Group")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 17)
            Text("Members")
                .font(.system(size: 21, weight: .regular))
                .padding(.vertical, 17)
            HStack(spacing: 30){
                ForEach(groupData.profileImages.indices) { index in
                    VStack {
                        self.groupData.profileImages[index]
                            .resizable()
                            .frame(width: 44, height: 44)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.3), radius: 3)
                        Text(self.groupData.names[index])
                            .font(.system(size: 13, weight: .light))
                    }
                }
                Spacer()
            }
            .padding(.bottom, 17)
            Text("Tasks")
                .font(.system(size: 21, weight: .regular))
                .padding(.vertical, 17)
            ScrollView {
                VStack(spacing: 17){
                    ForEach(groupData.activities.indices) { index in
                        TaskView(activity: self.groupData.activities[index])
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 30)
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
                Spacer()
            }
            .padding(.trailing, 13)
            .padding(.top, 13)
            .padding(.bottom, 7)
            Text(activity.description)
                .font(.system(size: 13, weight: .light))
            Spacer()
        }
        .padding(.horizontal, 19)
        .padding(.vertical, 13)
        .frame(width: screen.width - 60)
        .background(Color.gray.opacity(0.15)
                .shadow(color: Color.black.opacity(0.3), radius: 5))
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(groupData: testGroupsData[0])
    }
}
