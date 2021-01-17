//
//  UserChatView.swift
//  YourHealth
//
//  Created by pannullocarlo on 16/01/2021.
//

import SwiftUI

struct UserChatView: View {
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        
        ZStack{
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                VStack {
                                       
                    HStack(spacing : -10){
                        Image("dottoressa1")
                        .resizable()
                        .frame(width: 50, height: 50)
                        ChatBubble2(direction: .left) {
                            Text("Call me to book an appointment")
                                .padding(.all, 20)
                                .foregroundColor(Color.black)
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                        }
                   }.frame(maxWidth: 400, maxHeight: .infinity, alignment: .leading)
                    
                    
                    HStack(spacing : -10){
                        Image("dottoressa1")
                        .resizable()
                        .frame(width: 50, height: 50)
                        ChatBubble2(direction: .left) {
                            Text("This is my number: 3221110920")
                                .padding(.all, 20)
                                .foregroundColor(Color.black)
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                            }
                    }
                    .frame(maxWidth: 400, maxHeight: .infinity, alignment: .leading)
                    

                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("dottoressa1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    Text("Giulia Giordano")
                    .fontWeight(.semibold)
                }
            }
        })
    }
}


struct ChatBubble2<Content>: View where Content: View {
    let direction: ChatBubbleShape2.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape2.Direction, @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape2(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
        .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct ChatBubbleShape2: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}

struct Demo2: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing : -10){
                Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                ChatBubble2(direction: .left) {
                    Text("I'm your specialist")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(Color("Color"))
                    }
                }
                HStack(spacing : -10){
                Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                ChatBubble2(direction: .left) {
                    Text("Call me to book an appointment")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(Color("Color"))
                     }
                   }
                }
            }
        }
    }

struct UserChatView_Previews: PreviewProvider {
    static var previews: some View {
        UserChatView()
    }
}
