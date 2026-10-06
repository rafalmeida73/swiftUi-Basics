import SwiftUI

struct ContentView: View {
    let colorList1: [Color] = [
        .red,
        .purple,
        .green,
        .pink
    ]
    
    let colorList2: [Color] = [
        .black,
        .white,
        .blue,
        .pink
    ]
    
    @State private var screenTapped: Bool = false
    @State private var offsetY: CGFloat = 0
    let rotationAngle: CGFloat = 180.0
    
    var colors: [Color] {
        return screenTapped ? colorList1 : colorList2
    }
    
    var text: String {
        screenTapped ? "SwiftUi Basics" : "To know what you know what you do not know, that is true kowledge"
    }
    
    var  font: Font {
        screenTapped ? .largeTitle : .title
    }
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(
                0.8
            )
            .ignoresSafeArea()
            
            
            VStack {
              
                
                Text(
                    text
                ).font(
                    font
                )
                .fontWeight(
                    .semibold
                )
                .foregroundStyle(
                    .red
                ).offset(
                    y:offsetY
                ).multilineTextAlignment(
                    .center
                ).frame(
                    maxHeight: .infinity
                )
                
                
                Text(
                    "Another line of text"
                ).font(
                    font
                )
                .fontWeight(
                    .semibold
                )
                .foregroundStyle(
                    screenTapped ? .blue : .indigo
                    
                ).multilineTextAlignment(
                    .center
                ).frame(
                    maxHeight: .infinity
                )
                
               
                
            } .padding(
                .horizontal
            ).rotation3DEffect(
                .degrees(
                    screenTapped ? 0 : rotationAngle
                ),
                axis: (
                    x:1 ,
                    y: 1,
                    z: 0
                )
            )
            
            
        }
        .onTapGesture {
            screenTapped
                .toggle()
//            withAnimation(
//                .easeIn(
//                    duration: 3
//                )
//            ){
//                offsetY = screenTapped ? -1000 : 0
//            }
            
        }
    }
}

#Preview {
    ContentView()
}
