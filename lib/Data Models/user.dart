// This class holds all user information for authentication and database access
import 'package:pantry_app/Data%20Models/kitchen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PantryUser {
  //User information
  String _name; 
  String _email;
  String _uid;
  List<Kitchen> _kitchens;

  //Constructor
  PantryUser(User user)
    :_name = user.displayName!,
    _email = user.email!,
    _uid = user.uid,
    _kitchens = [];

  //Getters
  String getName() {
    return _name;
  }

  String getEmail() {
    return _email;
  }

  String getUid() {
    return _uid;
  }

  List<Kitchen> getKitchens() {
    return _kitchens;
  }

  //Setters
  void setName(String name) {
    _name = name;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setUid(String uid) {
    _uid = uid;
  }

  void setKitchens(List<Kitchen> kitchens) {
    _kitchens = kitchens;
  }

  //Add a kitchen to the user
  void addKitchen(Kitchen kitchen) {
    _kitchens.add(kitchen);
  }

  //Remove a kitchen from the user
  void removeKitchen(Kitchen kitchen) {
    _kitchens.remove(kitchen);
  }

  //Convert the user to a map
  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'email': _email,
      'uid': _uid,
      'kitchens': _kitchens,
    };
  }
}