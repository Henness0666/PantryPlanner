import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'inventory_item.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'item_database.db'),
    // When the database is first created, create a table to store items.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );


//define a function that stores user information locally
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the User into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same item is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts items into the database
  Future<void> insertFoodItem(FoodItem item) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the FoodItem into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same item is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the items from the items table.
  Future<List<FoodItem>> items() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The FoodItems.
    final List<Map<String, dynamic>> maps = await db.query('items');

    // Convert the List<Map<String, dynamic> into a List<FoodItem>.
    return List.generate(maps.length, (i) {
      return FoodItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        quantity: maps[i]['age'],
        expiryDate: DateTime.parse(maps[i]['expiry_date']),
        dateAdded: DateTime.parse(maps[i]['date_added']),
      );
    });
  }

  Future<void> updateFoodItem(FoodItem item) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given FoodItem.
    await db.update(
      'items',
      item.toMap(),
      // Ensure that the FoodItem has a matching id.
      where: 'id = ?',
      // Pass the FoodItem's id as a whereArg to prevent SQL injection.
      whereArgs: [item.id],
    );
  }

  Future<void> deleteFoodItem(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the FoodItem from the database.
    await db.delete(
      'items',
      // Use a `where` clause to delete a specific item.
      where: 'id = ?',
      // Pass the FoodItem's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
