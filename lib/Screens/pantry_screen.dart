import 'package:flutter/material.dart';
import 'package:pantry_app/Data%20Models/database.dart';
import '../Widgets/base_screen.dart';
import '../Data Models/inventory_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PantryScreen extends StatefulWidget {
  const PantryScreen({Key? key}) : super(key: key);

  @override
  PantryScreenState createState() => PantryScreenState();
}

class PantryScreenState extends State<PantryScreen> {
  String _nextItemId = '0'; // Variable to keep track of the next item ID
  List<FoodItem> pantryItems = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  DateTime? estimatedExpiration;
  DateTime? dateAdded;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Pantry',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAddItemForm(),
            const SizedBox(height: 20),
            const Text(
              'Pantry Items',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: _buildPantryItemList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddItemForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        SizedBox(height: 10),
        TextField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Quantity'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await _selectDate(context, true);
          },
          child: Text('Estimated Expiration'),
        ),
        Text(estimatedExpiration == null
            ? 'No date selected'
            : 'Selected date: ${_formatDate(estimatedExpiration!)}'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await _selectDate(context, false);
          },
          child: Text('Date Added'),
        ),
        Text(dateAdded == null ? 'No date selected' : 'Selected date: ${_formatDate(dateAdded!)}'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _addItemToDatabase();
          },
          child: Text('Add Item'),
        ),
      ],
    );
  }

  Widget _buildPantryItemList() {
  return StreamBuilder<QuerySnapshot>(
    // Replace 'pantry' with the name of your Firestore collection
    stream: FirebaseFirestore.instance.collection('pantry').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      // Clear the local pantryItems list to avoid duplicate entries
      pantryItems.clear();

      // Add the items from Firestore to the local pantryItems list
      for (DocumentSnapshot doc in snapshot.data!.docs) {
        FoodItem item = FoodItem(
          // Map the fields from Firestore to your FoodItem model
          id: doc.id, // Assuming you use the document ID as the item ID
          name: doc['name'],
          quantity: doc['quantity'],
          expiryDate: doc['expiryDate'].toDate(),
          dateAdded: doc['dateAdded'].toDate(),
          daysSinceAdded: 0,
          daysUntilExpiry: 123,
          isAddedRecently: true,
          isExpired: false,
          isExpiringSoon: false,
        );
        pantryItems.add(item);
      }

      return ListView.builder(
        itemCount: pantryItems.length,
        itemBuilder: (context, index) {
          final item = pantryItems[index];
          return Card(
            child: ListTile(
              title: Text(item.name),
              // ... (existing code)
            ),
          );
        },
      );
    },
  );
}

  Future<void> _selectDate(BuildContext context, bool isExpirationDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isExpirationDate) {
          estimatedExpiration = selectedDate;
        } else {
          dateAdded = selectedDate;
        }
      });
    }
  }

  void _addItemToDatabase() {
    String name = nameController.text.trim();
    int quantity = int.tryParse(quantityController.text.trim()) ?? 0;

    if (name.isNotEmpty && quantity > 0 && estimatedExpiration != null && dateAdded != null) {
      FoodItem item = FoodItem(
        id: _nextItemId, // Assign the next item ID
        name: name,
        quantity: quantity,
        expiryDate: estimatedExpiration!,
        dateAdded: dateAdded!,
        daysSinceAdded: 0,
        daysUntilExpiry: 123,
        isAddedRecently: true,
        isExpired: false,
        isExpiringSoon: false,
      );

      setState(() {
        pantryItems.add(item);
        // _nextItemId++; // Increment the next item ID for the next item to be added
        nameController.clear();
        quantityController.clear();
        estimatedExpiration = null;
        dateAdded = null;
      });

      // Add the item to Firestore using the Firestore emulator
      addDataToFirestore(item);
    } else {
      // Display an error or show a snackbar indicating that all fields are required
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
