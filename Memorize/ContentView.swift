import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var body: some View{
        return ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 5)
                Text("🚜").font(.largeTitle)
            }else {
                shape.fill(.red)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}
 




































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
    }
}
