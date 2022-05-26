import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗","🚕", "🚜","🚂", "✈️","🚙","🚌", "🚎","🏎", "🚓","🚑","🚒", "🚐","🛻", "🚚"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            LazyVGrid(columns:
                        ([GridItem(), GridItem()])){
                ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)

            }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1{
                emojiCount -= 1
            }
        }label: {
            VStack{
                Image(systemName: "minus.circle")
            }
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
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
                shape.stroke(lineWidth: 5)
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
