//
//  CodeSheetView.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//

import SwiftUI

struct CodeSheetView: View {
    @Environment(\.dismiss) private var dismiss
    let code: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text(code)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textSelection(.enabled)
                
                HStack(spacing: 16) {
                    Button(action: {
                        UIPasteboard.general.string = code
                    }) {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                    
                    Button(action: {
                        print("\n=== Squircle Extension Code ===")
                        print(code)
                        print("===========================\n")
                    }) {
                        Label("Print", systemImage: "printer")
                    }
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Generated Code")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
}

