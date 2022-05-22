//
//  Shimmer.swift
//  Library
//
//  Created by Shubham Kumar on 09/03/22.
//

import SwiftUI

/// A view modifier that applies an animated "shimmer" effect to any view
/// ```
/// Adds a modifier of Linear Animation with properties duration and bounce to the content body.
///
/// phase: Boolean value to create redacted or skeleton view.
/// active: Convenience parameter to conditionally enable the shimmer effect. Defaults to `true`.
/// duration: The duration of a shimmer cycle in seconds. Default: `1.5`.
/// bounce: Whether to bounce (reverse) the animation back and forth. Defaults to `false`.
///   ```
public struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
    var duration = 1.0
    var bounce = false
    public func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(phase: phase).animation(
                Animation.linear(duration: duration)
                    .repeatForever(autoreverses: bounce)
            ))
            .onAppear { phase = 0.8 }
    }
    /// An animatable modifier to interpolate between `phase` values.
    /// ```
    /// Adds a mask to the content body of the view with a `Gradient Mask` with scaleEffect of 3.
    /// ```
    struct AnimatedMask: AnimatableModifier {
        var phase: CGFloat = 0
        var animatableData: CGFloat {
            get { phase }
            set { phase = newValue }
        }
        func body(content: Content) -> some View {
            content
                .mask(GradientMask(phase: phase).scaleEffect(3))
        }
    }
    /// An animatable gradient between transparent and opaque to use as mask.
    /// The `phase` parameter shifts the gradient, moving the opaque band.
    /// ```
    ///  Gradient Mask is a View which has Linear Gradient of colors with three bands
    ///  Left and Right Bands will have opacity of 0.3.
    ///  Center band has color of same left and right band but with no opacity.
    ///
    ///  phase: The `phase` parameter shifts the gradient, moving the opaque band
    ///  centerColor: Color of the middle band
    ///  edgeColor: Color of left and right band with opacity
    ///  ```
    struct GradientMask: View {
        let phase: CGFloat
        let centerColor = Color.gray
        let edgeColor = Color.gray.opacity(0.5)
        var body: some View {
            LinearGradient(gradient:
                            Gradient(stops: [
                                .init(color: edgeColor, location: phase),
                                .init(color: centerColor, location: phase + 0.1),
                                .init(color: edgeColor, location: phase + 0.2)
                            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

public extension View {
    /// Adds an animated shimmering effect to any view
    /// ```
    /// Shimmering function is ViewBuilder which returns a modifier with Shimmer View Modifier Properties.
    ///
    /// active: Convenience parameter to conditionally enable the effect. Defaults to `true`.
    /// duration: The duration of a shimmer cycle in seconds. Default: `1.5`.
    /// bounce: Whether to bounce (reverse) the animation back and forth. Defaults to `false`.
    /// ```
    @ViewBuilder func shimmering(
        active: Bool = true, duration: Double = 1.5, bounce: Bool = false
    ) -> some View {
        if active {
            modifier(Shimmer(duration: duration, bounce: bounce))
        } else {
            self
        }
    }
}
