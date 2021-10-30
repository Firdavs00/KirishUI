//
//  ContentView.swift
//  ZadaniUI
//
//  Created by User on 29/10/21.
//
//
import SwiftUI

struct ContentView: View {
    
    private let colors = ["pink", "blue", "yellow"]
    private let imageName = ["images1" , "images2", "images3"]
    private let titles1 = ["Get Started"]
    private let titles2 = [ "But I must explain to you how all this mistekin idea of denouncing pleasure and priasing pain was born and I will give you a complete accaunt of the system.", "Explain to you how all this mistaken idea of pleasure and praising pain was born and I will give you a complete  accaunt of the system."]
    @State var viewIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $viewIndex) {
                myView(image: imageName[0], text1: titles1[0], text2: titles2[0])
                    .tag(0)
                myView(image: imageName[1], text1: titles1[0], text2: titles2[1])
                    .tag(1)
                myView(image: imageName[2], text1: titles1[0], text2: titles2[1])
                    .tag(2)
            }.frame(height: UIScreen.main.bounds.height * 2.1 / 3)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: viewIndex) { newValue in
                    print(newValue)
                }
            HStack(spacing:5) {
                ForEach((0..<colors.count), id:\.self){ index in
                    Rectangle()
                        .fill(Color(colors[index]))
                        .frame(width: viewIndex == index ? 50 : 20, height: 6)
                }
                Spacer()
            }.padding().padding(.top,1)
            Spacer()
            Button {
                withAnimation(.easeInOut) {
                    viewIndex += 1
                }
            } label: {
                HStack{
                    Spacer()
                    Text("Next")
                        .frame( height: 40).frame(maxWidth: .infinity)
                        .background(
                            ForEach(0..<colors.count, id:\.self){ color in
                                if viewIndex == color{
                                    Color(colors[color])
                                }
                            })
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .cornerRadius(8)
                    
                    Spacer()
                }
            }.disabled(viewIndex >= 2)
            Spacer()
        }
    }
    
    func myView(image: String, text1: String, text2: String) -> some View {
        
        VStack(spacing: 0) {
            HStack{
                Button {
                    withAnimation(.easeInOut) {
                        viewIndex -= 1
                    }
                }label: {
                    if viewIndex == 0{
                        Image("")
                    }else {
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20)).padding(.leading)
                    }
                }

                Spacer()
                
                Text("Skip").bold().font(.system(size: 20)).padding(.trailing)
            }
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            
            HStack{
                Text(text1)
                    .foregroundColor(Color.black)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }.padding(.bottom)
            
            Text(text2)
                .font(.headline)
            Spacer()
        }.padding(.leading,8).padding(.trailing,8)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
