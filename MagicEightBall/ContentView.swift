//
//  ContentView.swift
//  MagicEightBall
//
//  Created by Charles Joma on 2/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDark = false // This is for store the theme value so when we close the app the theme is remembered
    
    @State private var name: String = "Charles"
    @State private var questionInputField: String = ""
//    @State private var disabled = true // This was made redundant by .disabled(questionInputField == "")
    @State var ans = ""
    @State var text = "Ask \n Mr. Magic"
//
//    var playerName = "Charles"
//
//    let playerQuestion = "Am i going to ball like i want to?"
    func randomNumber(){
        let randInt = Int.random(in: 1...9)
        switch randInt {
        case 1:
           ans = "Yes - definitely"
        case 2:
           ans = "It is decidedly so"
        case 3:
           ans = "Without a doubt"
        case 4:
           ans = "Reply hazy, try again"
        case 5:
           ans = "Ask again later"
        case 6:
           ans = "Better not tell you now"
        case 7:
           ans = "My sources say no"
        case 8:
           ans = "Outlook not so good"
        case 9:
           ans = "Very doubtful"
        default:
           ans = "Hmmm, Try Again"
        }
    }
    
    var body: some View {
        NavigationView{
            
            VStack {
                Image("ball")
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
                    .offset(y: 80)
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("PressStart2P-Regular", size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 200)
                    .lineLimit(3)
                    .transition(.opacity)
                    .offset(y: -140)
                TextField("Go Ahead ?", text: $questionInputField)
                
                    .frame(height: 75)
                    .foregroundColor(isDark ? .white : .black)
                    .border(isDark ? .white : .black, width: 3)
                    .cornerRadius(5)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: -40)
                    .font(.custom("PressStart2P-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                
                Button(action: {
                    randomNumber();
                    text = ans
                    questionInputField = ""
                    print(ans)
                    print("Button Clicked")
                }){
                    Text("Ask Question")
                        .font(.custom("PressStart2P-Regular", size: 15))
                        .foregroundColor(.black)
                        .frame(maxHeight: 70, alignment: .center)
                        .frame(width: 300)
                        .overlay(RoundedRectangle(cornerRadius: 50)
                            .stroke(.gray, lineWidth: 5))
                        .background(.white)
                }
                .cornerRadius(50)
                .offset(y: -40)
                .disabled(questionInputField == "")
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{isDark.toggle()},label:{
                        isDark ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb.fill")
                    })
                }
            }
            .foregroundColor(isDark ? .white : .black)
        }
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
