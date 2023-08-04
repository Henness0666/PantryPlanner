import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/login_screen.dart';
import 'package:pantry_app/Widgets/side_menu.dart';

class AuthStreamBuilder extends StatefulWidget {
  final List<Widget> _widgetOptions;
  final List<String> _pageTitleOptions;

  AuthStreamBuilder({
    required List<Widget> widgetOptions,
    required List<String> pageTitleOptions,
  })  : _widgetOptions = widgetOptions,
        _pageTitleOptions = pageTitleOptions;

  @override
  _AuthStreamBuilderState createState() => _AuthStreamBuilderState();
}

class _AuthStreamBuilderState extends State<AuthStreamBuilder> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(2);
  final PageController _pageController = PageController(initialPage: 2);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _selectedIndex.value = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading spinner while waiting for auth state
        } else {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: ValueListenableBuilder<int>(
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    return Text(widget._pageTitleOptions[value]);
                  },
                ),
              ),
              drawer: const SideMenu(),
              body: PageView(
                controller: _pageController,
                children: widget._widgetOptions,
                onPageChanged: (index) {
                  _selectedIndex.value = index;
                },
              ),
              bottomNavigationBar: ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (context, value, child) {
                  return BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.restaurant_menu),
                        label: 'Meal Plans',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.list),
                        label: 'Shopping Lists',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Activity Feed',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.kitchen),
                        label: 'Pantries',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.receipt),
                        label: 'Recipes',
                      ),
                    ],
                    currentIndex: value,
                    selectedItemColor: Colors.amber[800],
                    unselectedItemColor: Colors.grey,
                    onTap: (index) {
                      _selectedIndex.value = index;
                      _pageController.jumpToPage(index);
                    },
                  );
                },
              ),
            );
          } else {
            return LoginScreen(); // User is not signed in, show login screen
          }
        }
      },
    );
  }
}
