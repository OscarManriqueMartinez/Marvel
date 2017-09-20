//
//  Heroes.swift
//
//  Created by Óscar Manrique on 20/9/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Heroes: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let superheroes = "superheroes"
  }

  // MARK: Properties
  public var superheroes: [Hero]?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    superheroes <- map[SerializationKeys.superheroes]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = superheroes { dictionary[SerializationKeys.superheroes] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
