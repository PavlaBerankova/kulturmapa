import SwiftUI

struct ShimmerEffect: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(width: 80, height: 80)
                        .padding(15)
                        //.shimmer(.init(color: .purple.opacity(0.4), highlight: .purple, blur: 15, highlightOpacity: 1, speed: 2, blendMode: .overlay))

                    VStack(alignment: .leading, spacing: 6) {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(maxWidth: .infinity)
                            .frame(height: 15)
                            .padding(.trailing, 20)

                        RoundedRectangle(cornerRadius: 4)
                            .frame(height: 15)
                            .frame(height: 15)
                            .padding(.trailing, 20)

                        RoundedRectangle(cornerRadius: 4)
                            .frame(height: 15)
                            .frame(height: 15)
                            .padding(.trailing, 20)
                    }
                }
            .shimmer(.init(color: .gray.opacity(0.3), highlight: .white, blur: 5))
        }
            Spacer()
    }
}


// View extension
extension View {
    @ViewBuilder
    func shimmer(_ config: ShimmerConfigurationValues)-> some View {
        self
            .modifier(ShimmerEffectModifier(config: config))
    }
}


// Shimmer Configuration Values
struct ShimmerConfigurationValues {
    var color: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 2
    var blendMode: BlendMode = .normal
}

struct ShimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffect()
    }
}


struct ShimmerEffectModifier: ViewModifier {
    //Configurations
    var config: ShimmerConfigurationValues
    // View properties
    @State private var moveTo:CGFloat = -0.7
    func body(content: Content) -> some View {
        content
        /// Adding Shimmer Animation with the help of the Masking Modifier
            .hidden()
        /// Hiding the Normal One and Adding Shimmer one instead
            .overlay {
                /// Adding the Shimmer instead
                Rectangle()
                    .fill(config.color)
                    .mask{content}
                    .overlay {
                        /// Creating Shimmer
                        GeometryReader { proxy in
                            let size = proxy.size
                            let extraOffset = (size.height / 2.5) + config.blur
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                    /// Glowing at the center
                                        .fill(
                                            .linearGradient(
                                                colors: [.white.opacity(0),config.highlight.opacity(config.highlightOpacity),.white.opacity(0)],
                                                startPoint: .top,
                                                endPoint: .bottom))
                                    /// Adding the blur effect
                                        .blur(radius: config.blur)
                                    /// Adding Rotation
                                        .rotationEffect(.init(degrees: -70))
                                    /// Moving to Start
                                        .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                                        .offset(x: size.width * moveTo)

                                }
                                .blendMode(config.blendMode)
                        }
                        /// Masking with the Content
                        .mask {
                            content
                        }
                    } /// creating the Animation when the View appears
                    .onAppear {
                        /// Making it happen in the main thread
                        DispatchQueue.main.async {
                            /// moving from beginning to end
                            moveTo = 0.7

                        }

                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}


#Preview {
    ShimmerEffect()
}
