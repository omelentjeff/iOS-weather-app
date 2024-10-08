//
//  SplashScreenView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI

/**
 A view representing the splash screen of the Weather App.
 */
struct SplashScreenView: View {
    /// Binding indicating whether the splash screen is currently presented.
    @Binding var isPresented: Bool
    
    /// The scale of the image.
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    /// The opacity of the image.
    @State private var imageOpacity = 1.0
    /// The opacity of the title.
    @State private var titleOpacity = 0.0
    /// The horizontal offset of the title.
    @State private var titleOffsetX: CGFloat = -100
    /// The overall opacity of the view.
    @State private var opacity = 1.0
    /// The color of the image.
    @State private var imageColor: Color = .yellow
    /// The opacity of the line.
    @State private var lineOpacity = 0.0 // Initial opacity of the line
    /// The length of the line.
    @State private var lineLength: CGFloat = 0 // Initial length of the line
    /// The rotation angle of the image.
    @State private var rotationAngle = Angle(degrees: 0)
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                VStack {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(imageColor)
                        .opacity(imageOpacity)
                        .scaleEffect(scale)
                        .rotationEffect(rotationAngle)
                    
                    Text("Weather App")
                        .font(Font.custom("Chalkduster", size: 32))
                        .foregroundColor(.white)
                        .opacity(titleOpacity)
                        .padding(.top, 20)
                        .offset(x: titleOffsetX)
                        .shadow(color: .white, radius: 1)
                    
                    Rectangle()
                        .fill(Color.white)
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
                            scale = CGSize(width: 1.2, height: 1.2)
                            rotationAngle = Angle(degrees: 180)
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
                    imageColor = .white
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
