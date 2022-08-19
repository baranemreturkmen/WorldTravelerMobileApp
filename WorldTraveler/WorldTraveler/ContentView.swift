//
//  ContentView.swift
//  WorldTraveler
//
//  Created by Baran Emre Türkmen on 16.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    @State var isVisible = false
    
    //Closure initializer
    let numberFormatter: NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter
        
    }()
    
    func convertToCelsius() -> String{
        
        if let value = Double(fahrenheitValue){
            let fahrenheit = Measurement<UnitTemperature>(value:value, unit:.fahrenheit)
            
            let celsiusValue = fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value:celsiusValue.value)) ?? "???"
            
            //return "\(celsiusValue.value)"
        }
        
        else{
            return "???"
        }
        
        
        
    }
    
    var body: some View {
        VStack{
            //Text("212").font(Font.system(size:64.0))
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER", text:$fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size:64.0))
                .multilineTextAlignment(.center)
            Text("CONVERSION_FAHRENHEITH")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray)
            /*Text(self.fahrenheitValue.isEmpty ? "???":self.fahrenheitValue).font(Font.system(size:64.0))*/
            Text(convertToCelsius())
            Text("CONVERSION_DEGREES_CELSIUS")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
        .opacity(isVisible ? 1.0:0.0)
        .offset(x:0,y:isVisible ? 0:20)
        .animation(.easeIn(duration: 2.0))
        .onAppear{
            self.isVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
