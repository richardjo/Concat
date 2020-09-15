//
//  FormView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct FormView: View {
    @State var isClicked = false
    @State var isSubmitted = false
    var body: some View {
        ZStack {
            if !isSubmitted {
                FormQuestionsView(isClicked: $isClicked, isSubmitted: $isSubmitted)
            }
            ContentView()
                .opacity(isSubmitted ? 1 : 0)
                .animation(.easeInOut(duration: 1))
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

struct QuestionView: View {
    var question: String!
    @State var answer = ""
    var query: String!
    var body: some View {
        VStack(alignment: .leading){
            Text(question)
                .font(.system(size: 23, weight: .semibold))
            TextField(query, text: $answer)
                .padding(.horizontal, 13)
                .frame(width: screen.width - 60, height: 50)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                .shadow(radius: 3)
                .padding(.bottom, 21)
        }
    }
}

struct FormQuestionsView: View {
    @Binding var isClicked: Bool
    @Binding var isSubmitted: Bool
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 30)
                QuestionView(question: "Name", query: "Enter name...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "Major", query: "Enter major...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "Class", query: "Enter graduation year...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "What is your favorite fruity loops\nflavor?", query: "Enter flavor...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "Is cereal soup?", query: "Enter yes/no...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "Pineapple on pizza?", query: "Enter yes/no...")
                    .onTapGesture {
                        self.isClicked = true
                }
                QuestionView(question: "Favorite show from your\nchildhood?", query: "Enter show...")
                    .onTapGesture {
                        self.isClicked = true
                }
                Text("Submit")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .frame(width: screen.width - 60, height: 50)
                    .background(Color(#colorLiteral(red: 0.3450980392, green: 0.1725490196, blue: 0.5137254902, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding(.top, 21)
                    .onTapGesture {
                        dismissKeyboard()
                        self.isSubmitted = true
                }
                
                Spacer()
            }
            .frame(width: screen.width)
            .onTapGesture(perform: {
                dismissKeyboard()
            })
        }
        .padding(.bottom, isClicked ? 300 : 0)
    }
}
