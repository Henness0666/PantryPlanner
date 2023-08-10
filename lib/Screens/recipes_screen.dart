import 'package:flutter/material.dart';

enum TileSize { small, medium, large }

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final List<String> categories = ['All', 'My Recipes', 'Trending', 'Top', 'New'];

  final List<Recipe> dummyRecipes = List.generate(
    20,
    (index) => Recipe(
      title: 'Recipe ${index + 1}',
      description: 'This is a description for Recipe ${index + 1}.',
      image: 'assets/images/480.png', // Update with your image path
    ),
  );

  final ValueNotifier<TileSize> _tileSizeNotifier = ValueNotifier<TileSize>(TileSize.small);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipes...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        // TODO: Implement filter functionality
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                icon: ValueListenableBuilder<TileSize>(
                  valueListenable: _tileSizeNotifier,
                  builder: (context, tileSize, child) {
                    switch (tileSize) {
                      case TileSize.small:
                        return Icon(Icons.view_list); // Icon for small tiles
                      case TileSize.medium:
                        return Icon(Icons.view_module); // Icon for medium tiles
                      case TileSize.large:
                        return Icon(Icons.view_headline); // Icon for large tiles
                      default:
                        return Icon(Icons.view_list);
                    }
                  },
                ),
                onPressed: () {
                  _tileSizeNotifier.value =
                      TileSize.values[(_tileSizeNotifier.value.index + 1) % TileSize.values.length];
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement category selection functionality
                  },
                  child: Text(categories[index]),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ValueListenableBuilder<TileSize>(
            valueListenable: _tileSizeNotifier,
            builder: (context, tileSize, child) {
              return ListView.builder(
                itemCount: dummyRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = dummyRecipes[index];
                  switch (tileSize) {
                    case TileSize.small:
                      return SmallRecipeTile(recipe: recipe);
                    case TileSize.medium:
                      return MediumRecipeTile(recipe: recipe);
                    case TileSize.large:
                      return LargeRecipeTile(recipe: recipe);
                    default:
                      return SmallRecipeTile(recipe: recipe);
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  RecipeTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Ensure there's no default color
      child: InkWell(
        onTap: () {
          // Handle the tap event here
          print('Recipe ${recipe.title} tapped!');
        },
        child: buildContent(context), // Call the buildContent method
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    // This will be overridden by the specific tile implementations
    return Container();
  }
}

class SmallRecipeTile extends RecipeTile {
  SmallRecipeTile({required Recipe recipe}) : super(recipe: recipe);

  @override
  Widget buildContent(BuildContext context) {
    // Define the layout for the small tile here using recipe properties
    // ...
    return Card(
      child: ListTile(
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        leading: Image.asset(recipe.image),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // TODO: Implement favorite functionality
          },
        ),
      ),
    );
  }
}

class MediumRecipeTile extends RecipeTile {
  MediumRecipeTile({required Recipe recipe}) : super(recipe: recipe);

  @override
  Widget buildContent(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the top
            children: [
              // Image on the left taking up 1/3 of the available width
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      recipe.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Information on the right taking up 2/3 of the available width
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(recipe.description),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // TODO: Implement favorite functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LargeRecipeTile extends RecipeTile {
  LargeRecipeTile({required Recipe recipe}) : super(recipe: recipe);

  @override
  Widget buildContent(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // This line adds the corner radius
              child: Image.asset(
                recipe.image,
                width: double.infinity, // Takes the full width
                fit: BoxFit
                    .cover, // Ensures the image covers the entire widget and crops any overflow
              ),
            ),
          ),
          ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // TODO: Implement favorite functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String title;
  final String description;
  final String image;

  Recipe({
    required this.title,
    required this.description,
    required this.image,
  });
}
