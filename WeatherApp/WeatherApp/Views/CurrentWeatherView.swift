//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var locationTitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(locationTitle).font(.system(size: 24))
            
            if let weatherData = viewModel.weatherData {
                VStack(spacing: 20) {
                    Spacer()
                    
                        HStack {
                            Text(String(format: "%.0f°", weatherData.current.temperature2M)).font(.system(size: 74)).padding()
                            Image(systemName: "sun.max").font(.system(size: 74))
                        }
                    
                    HourlyWeatherView(viewModel: viewModel)
                        .padding(.bottom, 40)
                        
                    VStack(spacing: 20) {
                        HStack(spacing: 80) {
                            if let maxTemperature = weatherData.daily.temperature2MMax.first {
                                Text(String(format: "H: %.0f°", maxTemperature))
                                    .font(.system(size: 20))
                            }
                            
                            if let minTemperature = weatherData.daily.temperature2MMin.first {
                                Text(String(format: "L: %.0f°", minTemperature))
                                    .font(.system(size: 20))
                            }
                        }
                        
                        HStack(spacing: 80) {
                            VStack(spacing: 5) {
                                Image(systemName: "sunrise").font(.system(size: 20))
                                Text(getHoursFormatted(stringArray: weatherData.daily.sunrise)[0]).font(.system(size: 20))
                            }
                            VStack(spacing: 5) {
                                Image(systemName: "sunset").font(.system(size: 20))
                                Text(getHoursFormatted(stringArray: weatherData.daily.sunset)[0]).font(.system(size: 20))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    //.cornerRadius(10)
                    
                    Spacer()
                }//.padding()
            } else {
                VStack(spacing: 20) {
                    Text("--°").font(.system(size: 50)).padding()
                    
                    VStack(spacing: 5) {
                        Text("H: --°").font(.system(size: 20))
                        Text("L: --°").font(.system(size: 20))
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    HourlyWeatherView(viewModel: viewModel)
                        .padding(.bottom, 40)
                    
                    Text("Loading...")
                }
            }
        }
    }
}

func getFormattedDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: Date())
}

