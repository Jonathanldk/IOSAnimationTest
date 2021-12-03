//
//  ContentView.swift
//  Shared
//
//  Created by Jonathan Navntoft Lundstrøm on 03/12/2021.
//

import SwiftUI



struct ContentView: View {
    @State var animate = false
    @State var endSplash = false
    @State var animateText = false
    
    var body: some View {
        
        ZStack{
            
            Homepage()
            
            ZStack{
                
                
                
                Color("BgColor")
                
            
                
                Image("BigFridgeOpen")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                    // Scalling view
                    .scaleEffect(animate ? 3 : 1)
                    // setting width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            // hiding view after fnished
            .opacity(endSplash ? 0 : 1)
        }
        
    }
    
    func animateSplash(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.00){
            
            
            withAnimation(Animation.easeOut(duration: 0.15)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.35)){
                endSplash.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20){
            
            
            withAnimation(Animation.easeOut(duration: 0.15)){
                animateText.toggle()
            }
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Homepage : View {
    
    var body: some View{
        VStack{
            
            HStack{
                Text("iFridge")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("BgColor"))
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
    
}
