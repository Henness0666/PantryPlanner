import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pantry_app/Data Models/shopping_list.dart';
import 'package:pantry_app/Screens/edit_item_screen.dart';

class ShoppingListDetailScreen extends StatefulWidget {
  final String listName;
  final List<ShoppingListItem> items;

  ShoppingListDetailScreen({required this.listName, required this.items});

  @override
  _ShoppingListDetailScreenState createState() => _ShoppingListDetailScreenState();
}

class _ShoppingListDetailScreenState extends State<ShoppingListDetailScreen> {
  late String listName;
  late TextEditingController titleController;
  bool isEditingTitle = false;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    listName = widget.listName;
    titleController = TextEditingController(text: listName);
  }

  @override
  void dispose() {
    titleController.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  bool isOnlyOneItemSelected() {
    int selectedCount = widget.items.where((item) => item.isEditingChecked).length;
    return selectedCount == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isEditMode
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isEditMode = false; // Exit edit mode
                    widget.items.forEach((item) {
                      item.isEditingChecked = false; // Reset the flag for all items
                    });
                  });
                },
              )
            : const BackButton(),
        title: isEditMode
            ? Text('Edit Mode')
            : (isEditingTitle
                ? TextField(
                    controller: titleController,
                    onSubmitted: (newTitle) {
                      setState(() {
                        listName = newTitle;
                        isEditingTitle = false;
                      });
                    },
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    autofocus: true,
                  )
                : Center(
                    child: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          isEditingTitle = true;
                        });
                      },
                      child: Text(listName),
                    ),
                  )),
        actions: isEditMode
            ? [
                if (isOnlyOneItemSelected())
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Edit action
                    },
                  ),
                IconButton(
                  icon: Icon(Icons.forward_rounded),
                  onPressed: () {
                    // Move action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete action
                  },
                ),
              ]
            : [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'editTitle',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Edit Title"),
                          Icon(Icons.edit, color: Colors.grey),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'share',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Share"),
                          Icon(Icons.share, color: Colors.grey),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'download',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Download"),
                          Icon(Icons.download, color: Colors.grey),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'print',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Print"),
                          Icon(Icons.print, color: Colors.grey),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delete"),
                          Icon(Icons.delete, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    // Handle the selected option here
                    if (value == 'editTitle') {
                      // Add logic to edit the title
                    }
                  },
                ),
              ],
      ),
      body: ReorderableListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return Slidable(
            key: ValueKey(item.name),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    if (item.isChecked) {
                      // If already checked, delete the item
                      setState(() {
                        widget.items.removeAt(index);
                      });
                    } else {
                      // If not checked, mark as checked
                      setState(() {
                        item.isChecked = true;
                      });
                    }
                  },
                  backgroundColor: item.isChecked ? Colors.red : Colors.green,
                  foregroundColor: Colors.white,
                  icon: item.isChecked ? Icons.delete : Icons.check,
                  label: item.isChecked ? 'Delete' : 'Check',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Navigate to edit screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditItemScreen(item: item)),
                    );
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: InkWell(
              key: ValueKey(item.name),
              onTap: () {
                setState(() {
                  if (isEditMode) {
                    // If in edit mode, toggle the isEditingChecked flag
                    item.isEditingChecked = !item.isEditingChecked;

                    // Check if no items are isEditingChecked
                    bool anyItemEditingChecked = widget.items.any((item) => item.isEditingChecked);
                    if (!anyItemEditingChecked) {
                      // If no items are isEditingChecked, exit edit mode
                      isEditMode = false;
                    }
                  } else {
                    // If not in edit mode, toggle the isChecked flag
                    item.isChecked = !item.isChecked;
                  }
                });
              },
              child: Card(
                color: item.isEditingChecked
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.25)
                    : (item.isChecked ? Colors.grey[900] : null),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        child: item.isChecked
                            ? ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey, // Apply grey color
                                  BlendMode.saturation, // Remove color saturation
                                ),
                                child: Image.asset('assets/images/banana.png'), // Product image
                              )
                            : Image.asset(
                                'assets/images/banana.png'), // Product image without filter
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 24.0, // Larger font size
                              // fontWeight: FontWeight.bold, // Bold font weight
                              decoration: item.isChecked ? TextDecoration.lineThrough : null,
                              color: item.isChecked ? Colors.grey : null,
                              // decorationThickness: item.isChecked ? 1.0 : null,
                              // decorationColor: item.isChecked ? Colors.green.withOpacity(0.5) : null,
                            ),
                          ), // Title on the left side

                          Text(
                            '${item.quantity} units',
                            style: TextStyle(color: item.isChecked ? Colors.grey : null),
                          ), // Quantity with unit on the right side
                        ],
                      ),
                      trailing: isEditMode
                          ? Checkbox(
                              value: item.isEditingChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  item.isEditingChecked = value!;

                                  // Check if no items are isEditingChecked
                                  bool anyItemEditingChecked =
                                      widget.items.any((item) => item.isEditingChecked);
                                  if (!anyItemEditingChecked) {
                                    // If no items are isEditingChecked, exit edit mode
                                    isEditMode = false;
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4), // Rounded corners
                              ),
                            )
                          : ReorderableDragStartListener(
                              index: index,
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(Icons.drag_handle_rounded),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              onLongPress: () {
                setState(() {
                  if (isEditMode) {
                    // If already in edit mode, exit edit mode and reset all flags
                    isEditMode = false;
                    widget.items.forEach((item) {
                      item.isEditingChecked = false; // Reset the flag for all items
                    });
                  } else {
                    // If not in edit mode, enter edit mode and set the flag for this specific item
                    isEditMode = true;
                    widget.items.forEach((item) {
                      item.isEditingChecked = false; // Reset the flag for all other items
                    });
                    item.isEditingChecked = true; // Set the flag for this specific item
                  }
                });
              },
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = widget.items.removeAt(oldIndex);
          widget.items.insert(newIndex, item);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Implement add new item functionality
        },
      ),
    );
  }
}
