/// We now have persistent data storage while using the emulators!
/// To import the database on emulator startup and export the database on emulator shutdown
/// Run the following command: firebase emulators:start --import databaseData --export-on-exit

import 'dart:async';
import 'inventory_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final CollectionReference pantryCollection = FirebaseFirestore.instance.collection('Groups');

  // Writing data to Firestore
  Future<void> addDataToFirestore(FoodItem item) async {
    try {
      // Replace 'pantry' with the name of your Firestore collection

      pantryCollection.add({
        'name': item.name,
        'quantity': item.quantity,
        'expiryDate': Timestamp.fromDate(item.expiryDate),
        'dateAdded': Timestamp.fromDate(item.dateAdded),
        // Add any other properties you want to store in Firestore
      });
      print('Item added to Firestore!');
    } catch (e) {
      print('Error adding item to Firestore: $e');
      // Handle the error accordingly
    }
  }

  // Reading data from Firestore
  void readDataFromFirestore() {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    usersCollection.doc('user_id').get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        print('User data: ${snapshot.data()}');
      } else {
        print('Document does not exist.');
      }
    }).catchError((error) {
      print('Error reading data from Firestore: $error');
    });
  }

  // Updating data in Firestore
  Future<void> updateDataInFirestore() async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc('user_id').update({'name': 'Jane Doe'});
      print('Data updated in Firestore!');
    } catch (e) {
      print('Error updating data in Firestore: $e');
    }
  }

  // Deleting data from Firestore
  Future<void> deleteDataFromFirestore() async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('pantry');
      await usersCollection.doc('name').delete();
      print('Data deleted from Firestore!');
    } catch (e) {
      print('Error deleting data from Firestore: $e');
    }
  }
}