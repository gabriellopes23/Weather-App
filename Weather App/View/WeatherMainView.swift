
import SwiftUI
import CoreLocation

struct WeatherMainView: View {
    @StateObject var locationVM = LocationViewModel()
    @StateObject var weatherVM = WeatherViewModel()
    @State var weatherModel: WeatherModel?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [backgroundColor, weatherRowColor, backgroundColor, weatherRowColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                if let location = locationVM.currentLocation {
                    if let weatherModel = weatherModel {
                        WeatherView(weatherModel: weatherModel)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weatherModel = try await weatherVM.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print("error \(error)")
                                }
                            }
                    }
                } else {
                    if locationVM.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationVM)
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherMainView()
}
