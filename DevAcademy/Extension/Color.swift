import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    let ink = Color("InkTextColor")
    let shadow = Color("ShadowColor")
    let light = Color("LightColor")
    let lightOne = Color("ToolbarBackground")
}

