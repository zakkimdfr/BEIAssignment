//
//  Coordinator.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

/// Protocol
/// Inheritance ke Class
protocol Coordinator: class {
    func start()
    func start(auth with: AuthEntry)
    func start(with option: DeepLinkOption?, indexTab with : SelectedTabEntry?)
    func start(consultation with: ConsultationModeEntry)
    func start(booking with: BookingModeEntry)
    func start(payment with: String)
    func start(family with: FamilyModeEntry)
}

enum ConsultationModeEntry {
    case listConsultation
    case initialScreening(Int, String?, Bool)
}

enum BookingModeEntry {
    case listDoctorSpecialization(String, Bool, Bool)
    case listSpecialization
    case detailDoctor(String, Bool)
    case searchAutocomplete
}

enum SelectedTabEntry{
    case tabIndex(Int)
}

enum AuthEntry{
    case login
    case register
    case forgotPassword
    case callCenter
}

enum FamilyModeEntry {
    case readFamily
    case listFamily
    case setPassword
    case addMember
}

enum AddressModeEntry {
    case addFamily
    case editFamily
    case editAddress
}
