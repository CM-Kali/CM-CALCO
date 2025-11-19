<h2>CM Scientific Calculator</h2>
A modern, web-optimized scientific calculator built with Flutter that provides both basic and advanced mathematical functions in a clean, responsive interface.


🚀 Features
Basic Operations
Arithmetic: Addition, Subtraction, Multiplication, Division

Advanced: Percentage, Power (^), Square Root

Utility: Clear (C), Backspace (⌫), Sign Change (±)

Memory: Parentheses support for complex expressions

Scientific Functions
Trigonometric: sin, cos, tan, asin, acos, atan (degrees)

Logarithmic: log (base 10), ln (natural log)

Exponential: x², x³, 10^x, e, π

Advanced: Factorial (x!), Reciprocal (1/x), Square Root (√)

Web-Optimized Design
Responsive Layout: Adapts to different screen sizes

Dual Panel: Scientific and basic functions visible simultaneously

Modern UI: Clean, dark theme with intuitive color coding

Horizontal Layout: Optimized for desktop and wide screens

🛠️ Technology Stack

Framework: Flutter 3.0+

Platform: Web (optimized for desktop browsers)

Architecture: MVC with StatefulWidget

Styling: Material Design with custom themes

📁 Project Structure
```
lib/
├── main.dart                 # Application entry point
├── splash_screen.dart        # Splash screen with CM Calco branding
└── calculator_screen.dart    # Main calculator interface
```
🚀 Getting Started
Prerequisites
Flutter SDK 3.0 or higher

Chrome browser (for web development)

Installation
Clone or create the project
```
flutter create cm_scientific_calculator
cd cm_scientific_calculator
```
Replace default files

Copy the provided Dart files to the lib/ directory

Update pubspec.yaml with the required dependencies

Install dependencies

```
flutter pub get
```
Run for web

```
flutter run -d chrome
```
Build for production

```
flutter build web
```
🎯 Usage
Basic Calculations
Enter numbers using the number pad

Use +, -, ×, ÷ for basic operations

Press = to see the result

Use C to clear or ⌫ to backspace

Scientific Functions
Trigonometric: Enter angle, then press sin/cos/tan

Logarithmic: Enter number, then press log/ln

Constants: Press π or e to insert mathematical constants

Power Functions: Use x², x³, or ^ for exponentiation

Advanced Features
Parentheses: Use ( and ) for complex expressions

Sign Change: Press ± to toggle positive/negative

Reciprocal: Press 1/x for inverse calculations


🌟 Key Features
Responsive Design: Optimized for desktop web browsers

Real-time Display: Shows current expression and result

Error Handling: Graceful handling of mathematical errors

Large Number Support: Handles very large and very small numbers

Decimal Precision: Configurable decimal places (6 by default)

🔧 Customization
Modifying Constants
Edit the display precision and limits in calculator_screen.dart:

```
// Change decimal precision
_output = value.toStringAsFixed(6); // Change 6 to desired precision

// Modify factorial limit
if (value >= 0 && value <= 20) // Adjust range as needed
Styling Changes
Update colors and styling in the _buildButton method:

dart
style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blueGrey[700], // Change button colors
  // ... other styling
)
```
🐛 Known Issues
Factorial function limited to numbers 0-20 for performance

Very large exponents may cause overflow

Some trigonometric results may have precision limitations

📱 Browser Compatibility
✅ Chrome (recommended)

✅ Firefox

✅ Safari

✅ Edge

🚀 Deployment
Build for Web
```
flutter build web --release
```

📄 License
This project is open source and available under the MIT License.

🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

📞 Support
If you encounter any problems or have suggestions, please open an issue on the repository.

Built with ❤️ using Flutter

CM Scientific Calculator - Making complex calculations simple
