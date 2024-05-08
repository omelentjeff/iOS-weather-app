//
//  SplashScreenView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var imageOpacity = 1.0
    @State private var titleOpacity = 0.0
    @State private var titleOffsetX: CGFloat = -100
    @State private var opacity = 1.0
    @State private var imageColor: Color = .white
    @State private var lineOpacity = 0.0 // Initial opacity of the line
    @State private var lineLength: CGFloat = 0 // Initial length of the line
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                        .foregroundStyle(imageColor)
                        .opacity(imageOpacity)
                        .scaleEffect(scale)
                    
                    Text("Weather App")
                        .font(Font.custom("Chalkduster", size: 32))
                        .foregroundColor(.blue)
                        .opacity(titleOpacity)
                        .padding(.top, 20)
                        .offset(x: titleOffsetX)
                        .shadow(color: .white, radius: 1)
                    
                    Rectangle()
                        .fill(Color.blue)
                        .opacity(lineOpacity)
                        .frame(height: 1)
                        .frame(width: lineLength)
                        .shadow(color: .white, radius: 0.5)
                }
            }
            
        }
        .opacity(opacity)
        .onAppear {
                    // Delay the initial scaling up animation by 0.2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 1.2)) {
                            scale = CGSize(width: 1.4, height: 1.4)
                            imageOpacity = 1
                        }
                    }
            
            /*withAnimation(.easeInOut(duration: 0.4).delay(1)) {
                titleOffsetX = 0
                titleOpacity = 1
            }*/
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 0.7)) {
                    titleOffsetX = 0
                    titleOpacity = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    lineOpacity = 1 // Make the line visible
                    lineLength = 200 // Adjust the desired length of the line
                }
            }
            
        
            
            /*for i in 0...7 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 + Double(i) * 0.1, execute: {
                    if imageOpacity == 0.0 {
                        imageOpacity = 1.0
                    } else {
                        imageOpacity = 0.0
                    }
                })
            }*/
            
            
            /*DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    titleOffsetX = 100
                    titleOpacity = 0
                }
            }*/
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    titleOpacity = 0
                    lineOpacity = 0 // Start fading out the line
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    lineLength = 0 // Reduce the length of the line to 0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.35)) {
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresented.toggle()
                }
            })
            
        }
    }
}
