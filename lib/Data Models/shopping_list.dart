import 'package:flutter/material.dart';

class ShoppingListItem {
  String name;
  int quantity;
  double estimatedCost;
  bool isChecked;
  bool isEditingChecked; // Add this field

  ShoppingListItem(
    this.name,
    this.quantity,
    this.estimatedCost, {
    this.isChecked = false,
    this.isEditingChecked = false, // Initialize this field
  });
}

class ShoppingList {
  IconData icon;
  String name;
  List<ShoppingListItem> items;

  ShoppingList(this.icon, this.name, this.items);
}
