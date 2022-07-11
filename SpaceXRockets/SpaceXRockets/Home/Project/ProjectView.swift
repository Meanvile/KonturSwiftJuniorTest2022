//
//  ProjectView.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import SwiftUI

struct ProjectView: View {
    
    @ObservedObject var viewModel: ProjectViewModel = ProjectViewModel()
    private var defaults: UserDefaults = UserDefaults.standard
    @State private var selection = 0
    @State private var color_h: Bool = UserDefaults.standard.bool(forKey: "h_meters")
    @State private var color_m: Bool = UserDefaults.standard.bool(forKey: "m_kg")
    @State private var color_d: Bool = UserDefaults.standard.bool(forKey: "d_meters")
    @State private var color_l: Bool = UserDefaults.standard.bool(forKey: "l_kg")
    
    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                VStack {
                    if self.viewModel.presenters.count >= 1 {
                        TabView(selection: $selection) {
                            ForEach(Array(zip(self.viewModel.presenters.indices, self.viewModel.presenters)), id: \.0) { index, item in
                                ProjectCell(viewModel: self.viewModel,presenter: item, geometryProxy: geometryReader)
                                    .tag(index)
                                    .ignoresSafeArea()
                            }
                        }
                        .frame(height: geometryReader.size.height - 30)
                        .ignoresSafeArea()
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .never))
                        NavigationLink(
                            destination: ProjectLaunchesView(with: self.viewModel.selectedRocketId, rocketName:self.viewModel.selectedRocketName),
                            isActive: self.$viewModel.navigateToDetail,
                            label: {EmptyView()})
                    }
                    Rectangle().fill(Color(red: 18 / 255, green: 18 / 255, blue: 18 / 255)).frame(width: geometryReader.size.width ,height:30, alignment: .bottom)
                    
                }
                .onAppear(perform: {self.viewModel.onAppear()})
                .ignoresSafeArea()
                
                if self.viewModel.navigateToSettings {
                    ZStack {
                        Rectangle()
                            .fill(.black)
                            .cornerRadius(35.0)
                            .frame(width: geometryReader.size.width, height: 744, alignment: .bottom)
                            .padding(.top, 100)
                            
                        HStack {
                            Text("Настройки")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 147)
                                .font(Font.custom("LabGrotesque", size: 16))
                            Button("Закрыть") {
                                withAnimation {
                                    self.viewModel.navigateToSettings = false
                                }
                            }
                            .font(Font.custom("LabGrotesque", size: 16))
                            .padding(.trailing, 24)
                        }
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(35.0)
                        .padding(.bottom, 596)
                        VStack {
                            HStack {
                                Text("Высота")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 28)
                                    .font(Font.custom("LabGrotesque", size: 16))
                                HStack(spacing:0) {
                                    Button("m") {
                                        self.viewModel.userDefaults.set(true, forKey: "h_meters")
                                        self.color_h = true
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(self.color_h ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(self.color_h ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                    Button("ft") {
                                        self.viewModel.userDefaults.set(false, forKey: "h_meters")
                                        self.color_h = false
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(!self.color_h ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(!self.color_h ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                }
                                .frame(width: 115, height: 40, alignment: .trailing)
                                .padding(.trailing, 31)
                            }
                            .padding(.top, 40)
                            .frame(width: geometryReader.size.width, height: 40)
                            HStack {
                                Text("Диаметр")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 28)
                                    .font(Font.custom("LabGrotesque", size: 16))
                                HStack(spacing:0) {
                                    Button("m") {
                                        self.viewModel.userDefaults.set(true, forKey: "d_meters")
                                        self.color_d = true
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(self.color_d ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(self.color_d ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                    Button("ft") {
                                        self.viewModel.userDefaults.set(false, forKey: "d_meters")
                                        self.color_d = false
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(!self.color_d ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(!self.color_d ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                }
                                .frame(width: 115, height: 40, alignment: .trailing)
                                .padding(.trailing, 31)
                            }
                            .frame(width: geometryReader.size.width, height: 40)
                            .background(Rectangle().fill(.black))
                            .padding(.top, 40)
                            HStack {
                                Text("Масса")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 28)
                                    .font(Font.custom("LabGrotesque", size: 16))
                                HStack(spacing:0) {
                                    Button("kg") {
                                        self.viewModel.userDefaults.set(true, forKey: "m_kg")
                                        self.color_m = true
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(self.color_m ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(self.color_m ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                    Button("lb") {
                                        self.viewModel.userDefaults.set(false, forKey: "m_kg")
                                        self.color_m = false
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(!self.color_m ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(!self.color_m ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                }
                                .frame(width: 115, height: 40, alignment: .trailing)
                                .padding(.trailing, 31)
                            }
                            .frame(width: geometryReader.size.width, height: 40)
                            .background(Rectangle().fill(.black))
                            .padding(.top, 25)
                            HStack {
                                Text("Полезная нагрузка")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 28)
                                    .font(Font.custom("LabGrotesque", size: 16))
                                HStack(spacing:0) {
                                    Button("kg") {
                                        self.viewModel.userDefaults.set(true, forKey: "l_kg")
                                        self.color_l = true
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(self.color_l ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(self.color_l ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                    Button("lb") {
                                        self.viewModel.userDefaults.set(false, forKey: "l_kg")
                                        self.color_l = false
                                    }
                                    .frame(width: 56, height: 34)
                                    .background(!self.color_l ? .white : Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                                    .cornerRadius(7.8)
                                    .foregroundColor(!self.color_l ? Color(red:18 / 255, green: 18 / 255, blue: 18 / 255) : Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                }
                                .frame(width: 115, height: 40, alignment: .trailing)
                                .padding(.trailing, 31)
                            }
                            .frame(width: geometryReader.size.width, height: 40)
                            .background(Rectangle().fill(.black))
                            .padding(.top, 25)
                        }
                        .background(Rectangle().fill(Color.black))
                        .foregroundColor(.white)
                        .frame(width: geometryReader.size.width, height: 400)
                        .padding(.bottom, 276)
                    }
                    .transition(.move(edge: .bottom))

                }
            }
            .ignoresSafeArea()
            .onAppear(perform: {self.viewModel.onAppear()})
            .navigationBarHidden(true)
            
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
