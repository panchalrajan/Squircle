# Squircle

A highly customizable SwiftUI package for creating smooth, continuous curves between squares and circles - commonly known as "squircles". This package provides an elegant way to create modern, aesthetically pleasing UI elements with customizable corners, shadows, and styling options.

![Squircle Examples](https://github.com/user-attachments/assets/02735749-ce5c-482e-a6ab-c0620c48c652)

## Features

- 🎨 Fully customizable corner radius and smoothness
- 🎯 Precise control over edge curvature
- 🌈 Support for solid colors and gradients
- ✨ Configurable stroke and shadow effects
- 📱 iOS 15.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+ support
- 🛠 Easy-to-use modifiers for common use cases
- 📖 Comprehensive documentation
- ✅ ~~Unit tested~~	

## Installation

### Swift Package Manager

Add this package to your Xcode project using Swift Package Manager:

1. In Xcode, select `File` → `Add Packages...`
2. Enter the package URL: `https://github.com/panchalrajan/Squircle.git`
3. Choose `Up to Next Major Version` with `1.0.0`

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/panchalrajan/Squircle.git", from: "1.0.0")
]
```

## Quick Start

```swift
import SwiftUI
import Squircle

struct ContentView: View {
    var body: some View {
        // Basic usage
        Rectangle()
            .squircle(cornerRadiusFactor: 0.2)
            
        // Card style
        Rectangle()
            .squircleCard(cornerRadius: 0.2, color: .white)
            
        // Custom configuration
        Rectangle()
            .squircle(SquircleConfiguration(
                cornerRadiusFactor: 0.2,
                smoothFactor: 0.15,
                edgeCurvatureMultiplier: 0.4,
                fillColor: .blue,
                shadow: true
            ))
    }
}
```

## Detailed Usage

### Basic Shape

```swift
Rectangle()
    .squircle(
        cornerRadiusFactor: 0.2,
        smoothFactor: 0.15,
        edgeCurvatureMultiplier: 0.4
    )
```

### Styling Options

```swift
// With gradient
Rectangle()
    .squircle(SquircleConfiguration(
        cornerRadiusFactor: 0.2,
        gradient: LinearGradient(
            colors: [.blue, .purple],
            startPoint: .leading,
            endPoint: .trailing
        )
    ))

// With stroke
Rectangle()
    .squircleOutlined(
        cornerRadius: 0.2,
        strokeColor: .blue,
        strokeWidth: 2
    )
```

### Pre-built Styles

```swift
// Card style
Rectangle()
    .squircleCard(
        cornerRadius: 0.2,
        color: .white
    )

// Button style
Rectangle()
    .squircleButton(
        cornerRadius: 0.2,
        gradient: LinearGradient(
            colors: [.blue, .purple],
            startPoint: .leading,
            endPoint: .trailing
        )
    )
```

## Demo App

Check out our [Squircle Demo App](https://github.com/panchalrajan/Squircle_Demo_Tweak) to see the package in action and experiment with different configurations in real-time. The demo app provides an interactive interface to customize all aspects of the Squircle shape and generates code snippets for your configurations.


## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](https://en.wikipedia.org/wiki/MIT_License) file for details.

## Author

Linkedin : [@panchalrajan](https://www.linkedin.com/in/panchalrajan/)

## Acknowledgments

Special thanks to our contributors and the SwiftUI community.
