//
//  ProjectCell.swift
//  SpaceXRockets
//
//  Created by Sergey on 12.04.2022.
//

import SwiftUI
import Kingfisher

struct ProjectCell: View {
    
    @ObservedObject var viewModel: ProjectViewModel = ProjectViewModel()
    private var presenter: ProjectPresenter!
    private var geometryProxy: GeometryProxy!
    private var settings: UserDefaults = UserDefaults.standard
    
    init(viewModel: ProjectViewModel,presenter: ProjectPresenter, geometryProxy: GeometryProxy) {
        self.viewModel = viewModel
        self.presenter = presenter
        self.geometryProxy = geometryProxy
    }
    
    var body: some View {
        VStack(spacing:-10) {
        ScrollView {
            ZStack {
                KFImage(URL(string: self.presenter.images))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: self.geometryProxy.size.width, height: 430)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .padding(.bottom, -33)
            .frame(alignment: .top)
            VStack(spacing: 30) {
                HStack {
                    Text(self.presenter.name)
                        .font(Font.custom("LabGrotesque", size: 30))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 48)
                        .padding(.leading, 32)
                    Button {
                        withAnimation {
                            self.viewModel.settingsNavigation()
                        }
                    } label: {
                        Image(systemName: "gearshape")
                                                .resizable()
                                                .frame(width:27, height:27, alignment: .trailing)
                                                .padding(.trailing, 35)
                                                .padding(.top, 48)
                    }
                    
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack {
                            if self.viewModel.userDefaults.bool(forKey: "h_meters") {
                                Text(String(format: "%.1f", self.presenter.height.meters!))
                                    .fontWeight(.bold)
                                Text("Высота, m")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            } else {
                                Text(String(format: "%.1f", self.presenter.height.feet!))
                                    .fontWeight(.bold)
                                Text("Высота, ft")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            }
                        }
                        .frame(width: 80, height: 80)
                        .padding()
                        .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                        .contentShape(Rectangle())
                        .cornerRadius(35.0)

                        VStack {
                            if self.viewModel.userDefaults.bool(forKey: "d_meters") {
                                Text(String(format: "%.1f", self.presenter.diameter.meters!))
                                    .fontWeight(.bold)
                                Text("Диаметр, m")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            } else {
                                Text(String(format: "%.1f", self.presenter.diameter.feet!))
                                    .fontWeight(.bold)
                                Text("Диаметр, ft")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            }
                        }
                        .frame(width: 80, height: 80)
                        .padding()
                        .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                        .contentShape(Rectangle())
                        .cornerRadius(35.0)
                        
                        
                        VStack {
                            if self.viewModel.userDefaults.bool(forKey: "m_kg") {
                                Text("\(self.presenter.mass.kg)")
                                    .fontWeight(.bold)
                                    .frame(width:110)
                                Text("Масса, kg")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            } else {
                                Text("\(self.presenter.mass.lb)")
                                    .fontWeight(.bold)
                                    .frame(width:110)
                                Text("Масса, lb")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                            }
                        }
                        .frame(width: 80, height: 80)
                        .padding()
                        .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                        .contentShape(Rectangle())
                        .cornerRadius(35.0)

                        VStack {
                            if self.viewModel.userDefaults.bool(forKey: "l_kg") {
                                let weight = self.presenter.payload.reduce(0) {(p, c) -> Int in
                                    return p + (c.id == "leo" ? c.kg: 0)}
                                Text("\(weight)")
                                    .fontWeight(.bold)
                            Text("Нагрузка, kg")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                .frame(width:90)
                            } else {
                                let weight = self.presenter.payload.reduce(0) {(p, c) -> Int in
                                    return p + (c.id == "leo" ? c.lb: 0)}
                                Text("\(weight)")
                                    .fontWeight(.bold)
                            Text("Нагрузка, lb")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 142 / 255, green: 142 / 255, blue: 143 / 255))
                                .frame(width:90)
                            }
                            
                        }
                        .frame(width: 80, height: 80)
                        .padding()
                        .fixedSize(horizontal: true, vertical: true)
                        .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                        .contentShape(Rectangle())
                        .cornerRadius(35.0)


                    }
                    .padding(.bottom, 20)
                    .padding([.trailing, .leading], 10)
                }
                HStack(spacing: 50) {
                    Text("Первый запуск")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                    Text("\(self.presenter.firstFlight)")
                        .frame(width: 150)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.leading, 32)
                .padding(.trailing, 22)
                .foregroundColor(Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255))
                Group {
                    HStack(spacing: 50) {
                        Text("Страна")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("\(self.presenter.country)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Стоимость запуска")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("$\(self.presenter.costPerLaunch) млн")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.leading, 10)
                    }
                    .padding(.leading, 32)
                    .padding(.trailing, 42)
                    .padding(.bottom, 30)
                    Text("Первая ступень")
                        .font(Font.custom("LabGrotesque", size: 24))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Количество двигателей")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("\(self.presenter.firstStage.engines)")
                    }
                    .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Количество топлива")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text(String(format: "%.1f", self.presenter.firstStage.fuel_amount_tons) + " " + "ton")
                    }
                    .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Время сгорания")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("\(self.presenter.firstStage.burn_time_sec ?? 0) sec")
                    }
                    .padding([.trailing, .leading], 32)
                    Text("Вторая ступень")
                        .font(Font.custom("LabGrotesque", size: 24))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.trailing, .leading], 32)
                        .padding(.top, 20)
                    HStack(spacing: 50) {
                        Text("Количество двигателей")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("\(self.presenter.secondStage.engines)")
                    }
                    .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Количество топлива")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text(String(format: "%.1f", self.presenter.secondStage.fuel_amount_tons) + " " + "ton")
                    }
                    .padding([.trailing, .leading], 32)
                    HStack(spacing: 50) {
                        Text("Время сгорания")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color(red: 202 / 255, green: 202 / 255, blue: 202 / 255))
                        Text("\(self.presenter.secondStage.burn_time_sec ?? 0) sec")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.trailing, .leading], 32)
                    .padding(.bottom, 30)
                }
                Text("Посмотреть запуски")
                    .frame(width: 311, height: 56)
                    .background(Color(red:33 / 255, green: 33 / 255, blue: 33 / 255))
                    .cornerRadius(12.0)
                    .padding(.bottom, 60)
                    .padding(.top, -20)
                    .font(Font.custom("LabGrotesque", size: 20))
                    .onTapGesture(perform: {self.viewModel.itemSelected(at:self.presenter.idRocket, name:self.presenter.name)})
            }
            .ignoresSafeArea()
            .frame(maxHeight: .infinity + 100,alignment: .top)
            .background(Rectangle().fill(Color.black))
            .cornerRadius(35.0)
            .padding(.bottom, -20)
            
        }
        .padding(.top, 40)
        .foregroundColor(Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255))
            Rectangle().fill(Color(red: 18 / 255, green: 18 / 255, blue: 18 / 255))
                .frame(width:self.geometryProxy.size.width, height:42)
        }
        .padding(.top, -40)
    }
}

