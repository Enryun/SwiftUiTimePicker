//
//  timePicker.swift
//  timePickerSiwftUI
//
//  Created by James Thang on 06/05/2022.
//

import SwiftUI

struct timePicker: View {
    
    @State private var isFrontSide = 0
    @State private var minutesSelectionFront = 0
    @State private var secondsSelectionFront = 0
    @State private var minutesSelectionBack = 0
    @State private var secondsSelectionBack = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    // For Parent View
//    @Binding var isShow: Bool
//    @Binding var isSave: Bool
    
//    var timeIntervalFront: TimeInterval
//    var timeIntervalBack: TimeInterval
    
    var minutes = [Int](0..<60)
    var seconds = [Int](0..<60)
    
    var body: some View {
        ZStack {
            VStack {}
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(.ultraThinMaterial)
                .onTapGesture {
//                    withAnimation {
//                        isShow.toggle()
//                    }
                }
            
            VStack(spacing: 5) {
                VStack {
                    Picker("Frontside or Backside time?", selection: $isFrontSide) {
                        Text("Frontside")
                            .tag(0)
                        Text("Backside")
                            .tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200, height: 40, alignment: .center)
                }
                .padding(.top, 20)
                
                
                
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Picker(selection: isFrontSide == 0 ? self.$minutesSelectionFront : self.$minutesSelectionBack, label: Text("")) {
                            ForEach(0 ..< self.minutes.count, id: \.self) { index in
                                Text("\(self.minutes[index]) min").tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: geometry.size.width/2, height: 250, alignment: .center)
                        .cornerRadius(10)
                        .clipped()
                        
                        Picker(selection: isFrontSide == 0 ? self.$secondsSelectionFront : self.$secondsSelectionBack, label: Text("")) {
                            ForEach(0 ..< self.seconds.count, id: \.self) { index in
                                Text("\(self.seconds[index]) sec").tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: geometry.size.width/2, height: 250, alignment: .center)
                        .clipped()
                    }
                }
                .padding(.horizontal, 30)
                .frame(height: 250)
                
                Button {
                    let timeIntervalFront = TimeInterval(minutesSelectionFront*60 + secondsSelectionFront)
                    let timeIntervalBack = TimeInterval(minutesSelectionBack*60 + secondsSelectionBack)

//                    isSave = true
//                    withAnimation {
//                        isShow.toggle()
//                    }
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Capsule().fill(.gray))
                }
                .padding(.bottom, 20)
            }
            .background(
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black.opacity(0.5))
                        .padding(.horizontal, 30)
                        .opacity(colorScheme == .dark ? 1 : 0)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black.opacity(0.7), lineWidth: 2)
                        .padding(.horizontal, 30)
                }
            )
        }
//        .onAppear(perform: convertTime)
    }
    
//    private func convertTime() {
//        let time = Int(timeIntervalFront)
//        let secondsFront = time % 60
//        let minutesFront = (time / 60) % 60
//        secondsSelectionFront = secondsFront
//        minutesSelectionFront = minutesFront
//
//        let timeBack = Int(timeIntervalBack)
//        let secondsBack = timeBack % 60
//        let minutesBack = (timeBack / 60) % 60
//        secondsSelectionBack = secondsBack
//        minutesSelectionBack = minutesBack
//    }
}

