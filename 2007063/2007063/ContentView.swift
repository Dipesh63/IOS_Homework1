import SwiftUI

struct ContentView: View {
    @State private var num1: String = ""
    @State private var num2: String = ""
    @State private var result: String = ""

    var body: some View {
        ZStack {
            // Background Color or Image (optional)
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Title
                Text("Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Spacer()
                
                // Input Fields
                VStack(spacing: 15) {
                    HStack {
                        Text("Number 1:")
                            .font(.headline)
                        Spacer()
                        TextField("Enter first number", text: $num1)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 150)
                    }
                    
                    HStack {
                        Text("Number 2:")
                            .font(.headline)
                        Spacer()
                        TextField("Enter second number", text: $num2)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 150)
                    }
                }
                .padding(.horizontal, 30)
                
                // Buttons for Calculations
                HStack(spacing: 20) {
                    Button(action: addNumbers) {
                        Text("+")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.green)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    Button(action: subtractNumbers) {
                        Text("-")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    Button(action: multiplyNumbers) {
                        Text("*")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.orange)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    Button(action: divideNumbers) {
                        Text("/")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                .padding(.top, 20)
                
                // Display Result
                if !result.isEmpty {
                    Text("Result: \(result)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    // Addition Logic
    func addNumbers() {
        guard let value1 = Double(num1), let value2 = Double(num2) else {
            result = "Invalid input"
            return
        }
        result = String(value1 + value2)
    }
    
    // Subtraction Logic
    func subtractNumbers() {
        guard let value1 = Double(num1), let value2 = Double(num2) else {
            result = "Invalid input"
            return
        }
        result = String(value1 - value2)
    }
    
    // Multiplication Logic
    func multiplyNumbers() {
        guard let value1 = Double(num1), let value2 = Double(num2) else {
            result = "Invalid input"
            return
        }
        result = String(value1 * value2)
    }
    
    // Division Logic
    func divideNumbers() {
        guard let value1 = Double(num1), let value2 = Double(num2) else {
            result = "Invalid input"
            return
        }
        
        if value2 == 0 {
            result = "Cannot divide by zero"
            return
        }
        
        result = String(value1 / value2)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
