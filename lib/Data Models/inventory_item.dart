// Purpose: Defines the FoodItem class, which is used to represent a single food item in the inventory.

import 'package:flutter/material.dart';


class FoodItem {
  final String id;
  final String name;
  final int quantity;
  final DateTime expiryDate;
  final DateTime dateAdded;
  final bool isExpired;
  final int daysUntilExpiry;
  final int daysSinceAdded;
  final bool isExpiringSoon;
  final bool isAddedRecently;

  FoodItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.expiryDate,
    required this.dateAdded,
    required this.isExpired,
    required this.daysUntilExpiry,
    required this.daysSinceAdded,
    required this.isExpiringSoon,
    required this.isAddedRecently,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'expiry_date': expiryDate.toIso8601String(),
      'date_added': dateAdded.toIso8601String(),
      'is_expired': isExpired ? 1 : 0,
      'days_until_expiry': daysUntilExpiry,
      'days_since_added': daysSinceAdded,
      'is_expiring_soon': isExpiringSoon ? 1 : 0,
      'is_added_recently': isAddedRecently ? 1 : 0,
    };
  }

  // Implement toString to make it easier to see information about
  // each food item when using the print statement.
  @override
  String toString() {
    return 'FoodItem{id: $id, name: $name, quantity: $quantity, expiryDate: $expiryDate, dateAdded: $dateAdded, isExpired: $isExpired, daysUntilExpiry: $daysUntilExpiry, daysSinceAdded: $daysSinceAdded, isExpiringSoon: $isExpiringSoon, isAddedRecently: $isAddedRecently}';
  }

  // Add a factory constructor to convert a Map to a FoodItem object
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      expiryDate: DateTime.parse(map['expiry_date']),
      dateAdded: DateTime.parse(map['date_added']),
      isExpired: map['is_expired'] == 1,
      daysUntilExpiry: map['days_until_expiry'],
      daysSinceAdded: map['days_since_added'],
      isExpiringSoon: map['is_expiring_soon'] == 1,
      isAddedRecently: map['is_added_recently'] == 1,
    );
  }
}