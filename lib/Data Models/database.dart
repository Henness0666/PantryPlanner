import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'inventory_item.dart';
import 'storage_location.dart';
import 'user.dart';
import 'kitchen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//initialization of the database class to start interacting with the current users data from the firebase database
class Database {
  late PantryUser _user;
  List<Kitchen> _kitchens = [];

  
}