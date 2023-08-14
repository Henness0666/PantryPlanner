import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/base_screen.dart';
import 'package:pantry_app/Data Models/shopping_list.dart';
import 'package:pantry_app/Screens/shopping_list_detail_screen.dart';

class ShoppingListScreen extends StatelessWidget {
  ShoppingListScreen({Key? key}) : super(key: key);

  final List<ShoppingList> shoppingLists = [
    ShoppingList(Icons.shopping_cart, 'Groceries', [
      ShoppingListItem('Milk', 2, 3.0),
      ShoppingListItem('Bread', 1, 2.0),
      ShoppingListItem('Eggs', 12, 1.5),
      ShoppingListItem('Butter', 1, 2.5),
      ShoppingListItem('Cheese', 1, 4.0),
      ShoppingListItem('Chicken', 2, 5.0),
      ShoppingListItem('Beef', 2, 6.0),
      ShoppingListItem('Fish', 2, 7.0),
      ShoppingListItem('Apples', 5, 1.0),
      ShoppingListItem('Bananas', 6, 0.5),
      ShoppingListItem('Oranges', 4, 0.8),
      ShoppingListItem('Tomatoes', 3, 1.2),
      ShoppingListItem('Potatoes', 5, 0.5),
      ShoppingListItem('Onions', 4, 0.7),
      ShoppingListItem('Carrots', 4, 0.6),
      ShoppingListItem('Lettuce', 2, 1.5),
      ShoppingListItem('Cereal', 2, 3.5),
      ShoppingListItem('Pasta', 3, 1.5),
      ShoppingListItem('Rice', 2, 2.5),
      ShoppingListItem('Olive Oil', 1, 6.0),
    ]),
    ShoppingList(Icons.cake, 'Birthday Party', [
      ShoppingListItem('Cake Mix', 1, 5.0),
      ShoppingListItem('Candles', 10, 1.0),
      ShoppingListItem('Balloons', 20, 0.1),
    ]),
    ShoppingList(Icons.local_florist, 'Gardening Supplies', [
      ShoppingListItem('Soil', 5, 3.0),
      ShoppingListItem('Seeds', 10, 0.5),
      ShoppingListItem('Fertilizer', 2, 5.0),
    ]),
    ShoppingList(Icons.local_cafe, 'Coffee Supplies', [
      ShoppingListItem('Coffee Beans', 1, 10.0),
      ShoppingListItem('Sugar', 1, 2.0),
      ShoppingListItem('Creamer', 1, 2.5),
    ]),
    ShoppingList(Icons.fastfood, 'Fast Food Night', [
      ShoppingListItem('Burgers', 4, 5.0),
      ShoppingListItem('Fries', 3, 2.0),
      ShoppingListItem('Soda', 4, 1.5),
    ]),
    ShoppingList(Icons.local_pizza, 'Pizza Party', [
      ShoppingListItem('Pizza', 5, 8.0),
      ShoppingListItem('Salad', 1, 4.0),
      ShoppingListItem('Wings', 12, 6.0),
    ]),
    ShoppingList(Icons.local_dining, 'Dinner Ingredients', [
      ShoppingListItem('Chicken', 2, 10.0),
      ShoppingListItem('Rice', 1, 2.0),
      ShoppingListItem('Vegetables', 3, 3.0),
    ]),
    ShoppingList(Icons.beach_access, 'Beach Day', [
      ShoppingListItem('Sunscreen', 1, 6.0),
      ShoppingListItem('Towels', 4, 5.0),
      ShoppingListItem('Umbrella', 1, 15.0),
    ]),
    ShoppingList(Icons.sports_baseball, 'Sports Equipment', [
      ShoppingListItem('Baseball', 3, 3.0),
      ShoppingListItem('Bat', 1, 20.0),
      ShoppingListItem('Gloves', 2, 15.0),
    ]),
    ShoppingList(Icons.music_note, 'Music Supplies', [
      ShoppingListItem('Guitar Strings', 2, 5.0),
      ShoppingListItem('Drum Sticks', 4, 3.0),
      ShoppingListItem('Sheet Music', 5, 1.0),
    ]),
    ShoppingList(Icons.book, 'Book Club', [
      ShoppingListItem('Novel', 3, 10.0),
      ShoppingListItem('Magazine', 5, 3.0),
      ShoppingListItem('Bookmark', 4, 0.5),
    ]),
    ShoppingList(Icons.computer, 'Tech Gadgets', [
      ShoppingListItem('Mouse', 1, 25.0),
      ShoppingListItem('Keyboard', 1, 40.0),
      ShoppingListItem('Monitor', 1, 100.0),
    ]),
    ShoppingList(Icons.kitchen, 'Kitchenware', [
      ShoppingListItem('Pots', 2, 20.0),
      ShoppingListItem('Pans', 2, 15.0),
      ShoppingListItem('Utensils', 5, 3.0),
    ]),
    ShoppingList(Icons.movie, 'Movie Night', [
      ShoppingListItem('Popcorn', 2, 2.0),
      ShoppingListItem('Soda', 4, 1.0),
      ShoppingListItem('DVD', 1, 15.0),
    ]),
    ShoppingList(Icons.bike_scooter, 'Cycling Gear', [
      ShoppingListItem('Helmet', 1, 30.0),
      ShoppingListItem('Gloves', 1, 10.0),
      ShoppingListItem('Pump', 1, 15.0),
    ]),
    ShoppingList(Icons.pets, 'Pet Supplies', [
      ShoppingListItem('Dog Food', 1, 20.0),
      ShoppingListItem('Cat Litter', 1, 10.0),
      ShoppingListItem('Fish Tank', 1, 50.0),
    ]),
    ShoppingList(Icons.school, 'School Supplies', [
      ShoppingListItem('Notebooks', 5, 1.0),
      ShoppingListItem('Pens', 10, 0.5),
      ShoppingListItem('Backpack', 1, 20.0),
    ]),
    ShoppingList(Icons.spa, 'Spa Day', [
      ShoppingListItem('Face Mask', 3, 2.0),
      ShoppingListItem('Bath Salt', 1, 5.0),
      ShoppingListItem('Candles', 4, 3.0),
    ]),
    ShoppingList(Icons.sports_soccer, 'Soccer Equipment', [
      ShoppingListItem('Soccer Ball', 1, 15.0),
      ShoppingListItem('Cleats', 1, 30.0),
      ShoppingListItem('Jersey', 1, 20.0),
    ]),
    ShoppingList(Icons.toys, 'Toys and Games', [
      ShoppingListItem('Board Game', 2, 20.0),
      ShoppingListItem('Action Figure', 3, 10.0),
      ShoppingListItem('Puzzle', 1, 5.0),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Shopping Lists',
      body: ReorderableListView.builder(
        itemCount: shoppingLists.length,
        itemBuilder: (context, index) {
          final list = shoppingLists[index];
          return ListTile(
            key: ValueKey(list.name),
            leading: Icon(list.icon),
            title: Text(list.name),
            subtitle: Text(
                'Items: ${list.items.length}, Estimated Cost: \$${list.items.fold(0.0, (sum, item) => sum + item.estimatedCost)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingListDetailScreen(
                    listName: list.name,
                    items: list.items,
                  ),
                ),
              );
            },
            trailing: ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons.drag_handle), // This is the drag indicator icon
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = shoppingLists.removeAt(oldIndex);
          shoppingLists.insert(newIndex, item);
        },
      ),
    );
  }
}
