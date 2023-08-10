import '/Data%20Models/inventory_item.dart';
import '/Data%20Models/storage_location.dart';

//initialization of the class to start a users local collection of food items
class Kitchen {
  //Kitchen database holds items
  //A list of items that are in the kitchen
  //A list of storage locations
  String name;
  List<FoodItem> items;
  List<StorageLocation> storageLocations;

  //initialization of the class to start the database
  Kitchen(this.name, this.items, this.storageLocations);

  //Getters
  String getName() {
    return name;
  }

  List<FoodItem> getItems() {
    return items;
  }

  List<StorageLocation> getStorageLocations() {
    return storageLocations;
  }

  //Setters
  void setName(String name) {
    this.name = name;
  }

  void setItems(List<FoodItem> items) {
    this.items = items;
  }

  void setStorageLocations(List<StorageLocation> storageLocations) {
    this.storageLocations = storageLocations;
  }

  //Add an item to the kitchen
  void addItem(FoodItem item) {
    items.add(item);
  }

  //Remove an item from the kitchen
  void removeItem(FoodItem item) {
    items.remove(item);
  }

  //Add a storage location to the kitchen
  void addStorageLocation(StorageLocation storageLocation) {
    storageLocations.add(storageLocation);
  }

  //Remove a storage location from the kitchen
  void removeStorageLocation(StorageLocation storageLocation) {
    storageLocations.remove(storageLocation);
  }
}