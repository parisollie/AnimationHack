//
//  ContentView.swift
//  AnimationHack
//
//  Created by Paul F on 12/03/25.
// Actualizado

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    //Paso 1.0
    @State var showDetail: Bool = false
    
    // MARK: Other Detail Content Visibilty
    //Paso 1.12
    @State var showDetailContent: Bool = false
    
    // MARK: Namespace
    //Paso 1.6
    @Namespace var animation
    var body: some View {
        //Paso 1.1
        NavigationView{
            VStack(spacing: 15){
                //Paso 1.4
                CardView(imageName: "Card1")
                //Paso 1.10
                if !showDetail{
                    CardView(imageName: "Card2")
                        //Paso 1.7
                        .matchedGeometryEffect(id: "CARD", in: animation)
                        //Paso 1.5
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 4)){
                                showDetail = true
                            }
                        }
                }
            }
            //Paso 1.2
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("SwiftUI Hack")
        }
        //Paso 1.8
        .overlay(alignment: .top) {
            //Paso 1.9
            if showDetail{
                VStack(spacing: 15){
                    CardView(imageName: "Card2")
                        .matchedGeometryEffect(id: "CARD", in: animation)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 4)){
                                showDetailContent = false
                            }
                            withAnimation(.easeInOut(duration: 4).delay(0.05)){
                                showDetail = false
                            }
                        }
                    //Paso 1.14
                    VStack{
                        // MARK: Your Detail Content Goes Here
                    }
                    .opacity(showDetailContent ? 1 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
                .background(Color.white.opacity(showDetailContent ? 1 : 0))
                // MARK: Hack
                // MARK: Use Transition
                // Paso 1.11,Avoid Identity & Offset With Zero
                .transition(.offset(x: 1, y: 1))
                //Paso 1.13
                .onAppear {
                    withAnimation(.easeInOut(duration: 4)){
                        showDetailContent = true
                    }
                }
            }
        }
    }
    
    // MARK: Card View
    //Paso 1.3
    @ViewBuilder
    func CardView(imageName: String)->some View{
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


#Preview {
    ContentView()
}
