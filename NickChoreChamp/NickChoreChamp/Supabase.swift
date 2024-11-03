//
//  Supabase.swift
//  NickChoreChamp
//
//  Created by Nick Chen on 11/2/24.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
    supabaseURL: Secrets.projectURL, supabaseKey: Secrets.apiKey)
