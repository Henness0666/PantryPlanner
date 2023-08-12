/// We now have persistent data storage while using the emulators!
/// To import the database on emulator startup and export the database on emulator shutdown
/// Run the following command: firebase emulators:start --import databaseData --export-on-exit

import 'dart:async';
import 'inventory_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final CollectionReference pantryCollection = FirebaseFirestore.instance.collection('Groups');

  // #region Firestore user CRUD operations
  Future<void> addUserToFirestore(String userId, Map<String, dynamic> userData) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).set(userData);
      print('User added to Firestore!');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserInfoFromFirestore(String userId) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      DocumentSnapshot snapshot = await usersCollection.doc(userId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('User not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching user info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateUserInfoInFirestore(String userId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).update(updatedData);
      print('User info updated in Firestore!');
    } catch (e) {
      print('Error updating user info in Firestore: $e');
    }
  }

  Future<void> deleteUserFromFirestore(String userId) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).delete();
      print('User deleted from Firestore!');
    } catch (e) {
      print('Error deleting user from Firestore: $e');
    }
  }
  // #endregion

  // #region Firestore ingredient CRUD operations
  Future<void> addIngredientToFirestore(String ingredientId, Map<String, dynamic> ingredientData) async {
    try {
      CollectionReference ingredientsCollection = FirebaseFirestore.instance.collection('ingredients');
      await ingredientsCollection.doc(ingredientId).set(ingredientData);
      print('Ingredient added to Firestore!');
    } catch (e) {
      print('Error adding ingredient to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getIngredientInfoFromFirestore(String ingredientId) async {
    try {
      CollectionReference ingredientsCollection = FirebaseFirestore.instance.collection('ingredients');
      DocumentSnapshot snapshot = await ingredientsCollection.doc(ingredientId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Ingredient not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching ingredient info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateIngredientInfoInFirestore(String ingredientId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference ingredientsCollection = FirebaseFirestore.instance.collection('ingredients');
      await ingredientsCollection.doc(ingredientId).update(updatedData);
      print('Ingredient info updated in Firestore!');
    } catch (e) {
      print('Error updating ingredient info in Firestore: $e');
    }
  }

  Future<void> deleteIngredientFromFirestore(String ingredientId) async {
    try {
      CollectionReference ingredientsCollection = FirebaseFirestore.instance.collection('ingredients');
      await ingredientsCollection.doc(ingredientId).delete();
      print('Ingredient deleted from Firestore!');
    } catch (e) {
      print('Error deleting ingredient from Firestore: $e');
    }
  }
  // #endregion

  // #region Firestore recipe CRUD operations
  Future<void> addRecipeToFirestore(String recipeId, Map<String, dynamic> recipeData) async {
    try {
      CollectionReference recipesCollection = FirebaseFirestore.instance.collection('recipes');
      await recipesCollection.doc(recipeId).set(recipeData);
      print('Recipe added to Firestore!');
    } catch (e) {
      print('Error adding recipe to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getRecipeInfoFromFirestore(String recipeId) async {
    try {
      CollectionReference recipesCollection = FirebaseFirestore.instance.collection('recipes');
      DocumentSnapshot snapshot = await recipesCollection.doc(recipeId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Recipe not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching recipe info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateRecipeInfoInFirestore(String recipeId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference recipesCollection = FirebaseFirestore.instance.collection('recipes');
      await recipesCollection.doc(recipeId).update(updatedData);
      print('Recipe info updated in Firestore!');
    } catch (e) {
      print('Error updating recipe info in Firestore: $e');
    }
  }

  Future<void> deleteRecipeFromFirestore(String recipeId) async {
    try {
      CollectionReference recipesCollection = FirebaseFirestore.instance.collection('recipes');
      await recipesCollection.doc(recipeId).delete();
      print('Recipe deleted from Firestore!');
    } catch (e) {
      print('Error deleting recipe from Firestore: $e');
    }
  }
  // #endregion

  // #region Firestore pantry CRUD operations
  Future<void> addPantryToFirestore(String pantryId, Map<String, dynamic> pantryData) async {
    try {
      CollectionReference pantriesCollection = FirebaseFirestore.instance.collection('pantries');
      await pantriesCollection.doc(pantryId).set(pantryData);
      print('Pantry added to Firestore!');
    } catch (e) {
      print('Error adding pantry to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getPantryInfoFromFirestore(String pantryId) async {
    try {
      CollectionReference pantriesCollection = FirebaseFirestore.instance.collection('pantries');
      DocumentSnapshot snapshot = await pantriesCollection.doc(pantryId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Pantry not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching pantry info from Firestore: $e');
      return null;
    }
  }

  Future<void> updatePantryInfoInFirestore(String pantryId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference pantriesCollection = FirebaseFirestore.instance.collection('pantries');
      await pantriesCollection.doc(pantryId).update(updatedData);
      print('Pantry info updated in Firestore!');
    } catch (e) {
      print('Error updating pantry info in Firestore: $e');
    }
  }

  Future<void> deletePantryFromFirestore(String pantryId) async {
    try {
      CollectionReference pantriesCollection = FirebaseFirestore.instance.collection('pantries');
      await pantriesCollection.doc(pantryId).delete();
      print('Pantry deleted from Firestore!');
    } catch (e) {
      print('Error deleting pantry from Firestore: $e');
    }
  }
  // #endregion

  // #region Firestore shopping list CRUD operations
  Future<void> addShoppingListToFirestore(String shoppingListId, Map<String, dynamic> shoppingListData) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).set(shoppingListData);
      print('Shopping list added to Firestore!');
    } catch (e) {
      print('Error adding shopping list to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getShoppingListInfoFromFirestore(String shoppingListId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      DocumentSnapshot snapshot = await shoppingListsCollection.doc(shoppingListId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Shopping list not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching shopping list info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateShoppingListInfoInFirestore(String shoppingListId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update(updatedData);
      print('Shopping list info updated in Firestore!');
    } catch (e) {
      print('Error updating shopping list info in Firestore: $e');
    }
  }

  Future<void> deleteShoppingListFromFirestore(String shoppingListId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).delete();
      print('Shopping list deleted from Firestore!');
    } catch (e) {
      print('Error deleting shopping list from Firestore: $e');
    }
  }

  Future<void> addRecipeToShoppingListInFirestore(String shoppingListId, String recipeId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'recipes': FieldValue.arrayUnion([recipeId]),
      });
      print('Recipe added to shopping list in Firestore!');
    } catch (e) {
      print('Error adding recipe to shopping list in Firestore: $e');
    }
  }

  Future<void> removeRecipeFromShoppingListInFirestore(String shoppingListId, String recipeId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'recipes': FieldValue.arrayRemove([recipeId]),
      });
      print('Recipe removed from shopping list in Firestore!');
    } catch (e) {
      print('Error removing recipe from shopping list in Firestore: $e');
    }
  }

  Future<void> addIngredientToShoppingListInFirestore(String shoppingListId, String ingredientId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'ingredients': FieldValue.arrayUnion([ingredientId]),
      });
      print('Ingredient added to shopping list in Firestore!');
    } catch (e) {
      print('Error adding ingredient to shopping list in Firestore: $e');
    }
  }

  Future<void> removeIngredientFromShoppingListInFirestore(String shoppingListId, String ingredientId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'ingredients': FieldValue.arrayRemove([ingredientId]),
      });
      print('Ingredient removed from shopping list in Firestore!');
    } catch (e) {
      print('Error removing ingredient from shopping list in Firestore: $e');
    }
  }

  Future<void> addFoodItemToShoppingListInFirestore(String shoppingListId, String foodItemId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'foodItems': FieldValue.arrayUnion([foodItemId]),
      });
      print('Food item added to shopping list in Firestore!');
    } catch (e) {
      print('Error adding food item to shopping list in Firestore: $e');
    }
  }

  Future<void> removeFoodItemFromShoppingListInFirestore(String shoppingListId, String foodItemId) async {
    try {
      CollectionReference shoppingListsCollection = FirebaseFirestore.instance.collection('shoppingLists');
      await shoppingListsCollection.doc(shoppingListId).update({
        'foodItems': FieldValue.arrayRemove([foodItemId]),
      });
      print('Food item removed from shopping list in Firestore!');
    } catch (e) {
      print('Error removing food item from shopping list in Firestore: $e');
    }
  }
  // #endregion
  
  // #region Firestore group CRUD operations
  Future<void> addGroupToFirestore(String groupId, Map<String, dynamic> groupData) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).set(groupData);
      print('Group added to Firestore!');
    } catch (e) {
      print('Error adding group to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getGroupInfoFromFirestore(String groupId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      DocumentSnapshot snapshot = await groupsCollection.doc(groupId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Group not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching group info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateGroupInfoInFirestore(String groupId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update(updatedData);
      print('Group info updated in Firestore!');
    } catch (e) {
      print('Error updating group info in Firestore: $e');
    }
  }

  Future<void> deleteGroupFromFirestore(String groupId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).delete();
      print('Group deleted from Firestore!');
    } catch (e) {
      print('Error deleting group from Firestore: $e');
    }
  }

  Future<void> addUserToGroupInFirestore(String groupId, String userId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'users': FieldValue.arrayUnion([userId]),
      });
      print('User added to group in Firestore!');
    } catch (e) {
      print('Error adding user to group in Firestore: $e');
    }
  }

  Future<void> removeUserFromGroupInFirestore(String groupId, String userId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'users': FieldValue.arrayRemove([userId]),
      });
      print('User removed from group in Firestore!');
    } catch (e) {
      print('Error removing user from group in Firestore: $e');
    }
  }

  Future<void> addShoppingListToGroupInFirestore(String groupId, String shoppingListId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'shoppingLists': FieldValue.arrayUnion([shoppingListId]),
      });
      print('Shopping list added to group in Firestore!');
    } catch (e) {
      print('Error adding shopping list to group in Firestore: $e');
    }
  }

  Future<void> removeShoppingListFromGroupInFirestore(String groupId, String shoppingListId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'shoppingLists': FieldValue.arrayRemove([shoppingListId]),
      });
      print('Shopping list removed from group in Firestore!');
    } catch (e) {
      print('Error removing shopping list from group in Firestore: $e');
    }
  }

  Future<void> addRecipeToGroupInFirestore(String groupId, String recipeId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'recipes': FieldValue.arrayUnion([recipeId]),
      });
      print('Recipe added to group in Firestore!');
    } catch (e) {
      print('Error adding recipe to group in Firestore: $e');
    }
  }

  Future<void> removeRecipeFromGroupInFirestore(String groupId, String recipeId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'recipes': FieldValue.arrayRemove([recipeId]),
      });
      print('Recipe removed from group in Firestore!');
    } catch (e) {
      print('Error removing recipe from group in Firestore: $e');
    }
  }

  Future<void> addMealPlanToGroupInFirestore(String groupId, String mealPlanId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'mealPlans': FieldValue.arrayUnion([mealPlanId]),
      });
      print('Meal plan added to group in Firestore!');
    } catch (e) {
      print('Error adding meal plan to group in Firestore: $e');
    }
  }

  Future<void> removeMealPlanFromGroupInFirestore(String groupId, String mealPlanId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'mealPlans': FieldValue.arrayRemove([mealPlanId]),
      });
      print('Meal plan removed from group in Firestore!');
    } catch (e) {
      print('Error removing meal plan from group in Firestore: $e');
    }
  }
  // #endregion

  // #region Firestore kitchen CRUD operations
  Future<void> addKitchenToFirestore(String kitchenId, Map<String, dynamic> kitchenData) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).set(kitchenData);
      print('Kitchen added to Firestore!');
    } catch (e) {
      print('Error adding kitchen to Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> getKitchenInfoFromFirestore(String kitchenId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      DocumentSnapshot snapshot = await kitchensCollection.doc(kitchenId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Kitchen not found in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error fetching kitchen info from Firestore: $e');
      return null;
    }
  }

  Future<void> updateKitchenInfoInFirestore(String kitchenId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update(updatedData);
      print('Kitchen info updated in Firestore!');
    } catch (e) {
      print('Error updating kitchen info in Firestore: $e');
    }
  }

  Future<void> deleteKitchenFromFirestore(String kitchenId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).delete();
      print('Kitchen deleted from Firestore!');
    } catch (e) {
      print('Error deleting kitchen from Firestore: $e');
    }
  }

  Future<void> addKitchenToUserInFirestore(String userId, String kitchenId) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).update({
        'kitchens': FieldValue.arrayUnion([kitchenId]),
      });
      print('Kitchen added to user in Firestore!');
    } catch (e) {
      print('Error adding kitchen to user in Firestore: $e');
    }
  }

  Future<void> removeKitchenFromUserInFirestore(String userId, String kitchenId) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).update({
        'kitchens': FieldValue.arrayRemove([kitchenId]),
      });
      print('Kitchen removed from user in Firestore!');
    } catch (e) {
      print('Error removing kitchen from user in Firestore: $e');
    }
  }

  Future<void> addShoppingListToKitchenInFirestore(String kitchenId, String shoppingListId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'shoppingLists': FieldValue.arrayUnion([shoppingListId]),
      });
      print('Shopping list added to kitchen in Firestore!');
    } catch (e) {
      print('Error adding shopping list to kitchen in Firestore: $e');
    }
  }

  Future<void> removeShoppingListFromKitchenInFirestore(String kitchenId, String shoppingListId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'shoppingLists': FieldValue.arrayRemove([shoppingListId]),
      });
      print('Shopping list removed from kitchen in Firestore!');
    } catch (e) {
      print('Error removing shopping list from kitchen in Firestore: $e');
    }
  }

  Future<void> addRecipeToKitchenInFirestore(String kitchenId, String recipeId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'recipes': FieldValue.arrayUnion([recipeId]),
      });
      print('Recipe added to kitchen in Firestore!');
    } catch (e) {
      print('Error adding recipe to kitchen in Firestore: $e');
    }
  }

  Future<void> removeRecipeFromKitchenInFirestore(String kitchenId, String recipeId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'recipes': FieldValue.arrayRemove([recipeId]),
      });
      print('Recipe removed from kitchen in Firestore!');
    } catch (e) {
      print('Error removing recipe from kitchen in Firestore: $e');
    }
  }

  Future<void> addMealPlanToKitchenInFirestore(String kitchenId, String mealPlanId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'mealPlans': FieldValue.arrayUnion([mealPlanId]),
      });
      print('Meal plan added to kitchen in Firestore!');
    } catch (e) {
      print('Error adding meal plan to kitchen in Firestore: $e');
    }
  }

  Future<void> removeMealPlanFromKitchenInFirestore(String kitchenId, String mealPlanId) async {
    try {
      CollectionReference kitchensCollection = FirebaseFirestore.instance.collection('kitchens');
      await kitchensCollection.doc(kitchenId).update({
        'mealPlans': FieldValue.arrayRemove([mealPlanId]),
      });
      print('Meal plan removed from kitchen in Firestore!');
    } catch (e) {
      print('Error removing meal plan from kitchen in Firestore: $e');
    }
  }

  Future<void> addKitchenToGroupInFirestore(String groupId, String kitchenId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'kitchens': FieldValue.arrayUnion([kitchenId]),
      });
      print('Kitchen added to group in Firestore!');
    } catch (e) {
      print('Error adding kitchen to group in Firestore: $e');
    }
  }

  Future<void> removeKitchenFromGroupInFirestore(String groupId, String kitchenId) async {
    try {
      CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
      await groupsCollection.doc(groupId).update({
        'kitchens': FieldValue.arrayRemove([kitchenId]),
      });
      print('Kitchen removed from group in Firestore!');
    } catch (e) {
      print('Error removing kitchen from group in Firestore: $e');
    }
  }
}