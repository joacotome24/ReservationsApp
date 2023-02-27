//
//  LocationsView.swift
//  LittleLemonReservation
//
//  Created by Joaquin Tome on 28/1/23.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo().padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
       }
    }
}

struct RestaurantView: View {
  private var restaurant:RestaurantLocation
  
  init(_ restaurant:RestaurantLocation) {
    self.restaurant = restaurant
  }
  
  var body: some View {
    VStack (alignment: .leading, spacing:3){
      Text(restaurant.city)
        .font(.title2)
      
      HStack {
        Text(restaurant.neighborhood)
        Text("–")
        Text(restaurant.phoneNumber)
      }
      .font(.caption)
      .foregroundColor(.gray)

    }
  }
}



