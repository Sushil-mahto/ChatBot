//
//  ContentView.swift
//  ChatBot
//
//  Created by SUshil on 18/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to chat Bot"]
    var body: some View {
        VStack{
            HStack{
                Text("iBot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.blue)
            }
            ScrollView{
                //message
                
                ForEach(messages,id:\.self){message in
                    if message.contains("[USER"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(.blue.opacity(0.5))
                                .cornerRadius(10)
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                        }
                    }else{
                        HStack{
                            
                            Text(message)
                                .padding()
                                
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                            Spacer()
                        }
                    }
                    
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(.gray.opacity(0.09))
            HStack{
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button{
                    //sendMessage
                    sendMessage(message: messageText)
                }label: {
                    Image(systemName: "paperplane.fill")
                }.font(.system(size: 26))
                    .padding(.horizontal,10)
            }
            .padding()
        }
    }
    func sendMessage(message:String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline:.now() + 1 ){
            withAnimation{
                messages.append(getResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
