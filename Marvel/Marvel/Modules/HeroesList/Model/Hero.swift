//
//  Superheroes.swift
//
//  Created by Óscar Manrique on 20/9/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Hero: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let groups = "groups"
    static let height = "height"
    static let name = "name"
    static let realName = "realName"
    static let photo = "photo"
    static let power = "power"
    static let abilities = "abilities"
  }

  // MARK: Properties
  public var groups: String?
  public var height: String?
  public var name: String?
  public var realName: String?
  public var photo: String?
  public var power: String?
  public var abilities: String?

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
    groups <- map[SerializationKeys.groups]
    height <- map[SerializationKeys.height]
    name <- map[SerializationKeys.name]
    realName <- map[SerializationKeys.realName]
    photo <- map[SerializationKeys.photo]
    power <- map[SerializationKeys.power]
    abilities <- map[SerializationKeys.abilities]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = groups { dictionary[SerializationKeys.groups] = value }
    if let value = height { dictionary[SerializationKeys.height] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = realName { dictionary[SerializationKeys.realName] = value }
    if let value = photo { dictionary[SerializationKeys.photo] = value }
    if let value = power { dictionary[SerializationKeys.power] = value }
    if let value = abilities { dictionary[SerializationKeys.abilities] = value }
    return dictionary
  }

}
