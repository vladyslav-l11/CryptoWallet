//
//  AsyncTask.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Combine

typealias AsyncTask<T> = AnyPublisher<T, Error>
