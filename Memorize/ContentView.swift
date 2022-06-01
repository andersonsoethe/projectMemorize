import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗","🚕", "🚜","🚂", "✈️","🚙","🚌", "🚎","🏎", "🚓","🚑","🚒", "🚐","🛻", "🚚"]
    
    @State var emojiCount = 15
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns:
                            ([GridItem(.adaptive(minimum: 65))])){
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            .font(.largeTitle)
            .padding(.horizontal)
            }
        .padding(.horizontal)
    }

}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View{
        return ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
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
//        ContentView()
//            .preferredColorScheme(.light)
//            .previewDevice("iPhone 12 mini")
    }
}
