//
//  SplitDetailsView.swift
//  splitbills.group7
//
//  Created by Muhamad Gatot Supiadin on 10/03/25.
//

import SwiftUI

struct SplitDetailsView: View {
    
    @State var friends: [(name: String, color: Color)] = []
    @State var price: Double?
    @State var name: String = ""
    
    // Custom Number Formatter to allow only numbers
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal  // Allows only numbers
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2 // Allows up to 2 decimal places
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    var body: some View {
        
        VStack{
            TextField("Input product name", text: $name)
                .frame(height: 35)
                .foregroundColor(.black)
                .autocapitalization(.none)
                .background(Color.clear)
                .textFieldStyle(.roundedBorder)
            TextField("Input product price", value: $price, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .frame(height: 35)
                .foregroundColor(.black)
                .autocapitalization(.none)
                .background(Color.clear)
                .textFieldStyle(.roundedBorder)
        }.padding()
    }
}

#Preview{
    SplitDetailsView()
}
