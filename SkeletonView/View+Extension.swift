//
//  View+Extension.swift
//  SkeletonView
//
//  Created by Shubham Kumar on 22/05/22.
//

import SwiftUI

extension View {
    /// Changes the view to Skeleton View and Adds Shimmering Effect
    /// ```
    /// View.isRedacted(_ when: Bool, enableShimmer: Bool = true, duration: Double = 1.5, bounce: Bool = false) -> View
    ///
    /// ViewModifier which returns a view depending on when parameter.
    /// It takes 4 parameters with three being optional.
    /// when: Controls the redated state of the view
    /// active: Controls whether shimmer effect is needed.
    /// ```
    ///
    /// - Parameters:
    ///   - when: Boolean value to create redacted or skeleton view.
    ///   - active: Convenience parameter to conditionally enable the shimmer effect. Defaults to `true`.
    ///   - duration: The duration of a shimmer cycle in seconds. Default: `1.5`.
    ///   - bounce: Whether to bounce (reverse) the animation back and forth. Defaults to `false`.
    /// - Returns: A skeleton view of type `View`
    @ViewBuilder public func isRedacted(_ when: Bool, enableShimmer: Bool = true, duration: Double = 1.5, bounce: Bool = false) -> some View {
        if when {
            self.redacted(reason: .placeholder).shimmering(active: enableShimmer, duration: duration, bounce: bounce)
        } else {
            self
        }
    }
}
