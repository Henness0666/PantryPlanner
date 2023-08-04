import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/login_screen.dart';
import 'package:pantry_app/Widgets/side_menu.dart';

class AuthStreamBuilder extends StatelessWidget {
  final PageController _pageController;
  final List<Widget> _widgetOptions;
  final List<String> _pageTitleOptions;
  final void Function(int) _onItemTapped;
  int _selectedIndex;

  AuthStreamBuilder({
    required PageController pageController,
    required List<Widget> widgetOptions,
    required List<String> pageTitleOptions,
    required void Function(int) onItemTapped,
    required int selectedIndex,
  })  : _pageController = pageController,
        _widgetOptions = widgetOptions,
        _pageTitleOptions = pageTitleOptions,
        _onItemTapped = onItemTapped,
        _selectedIndex = selectedIndex;

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
                title: Text(_pageTitleOptions[_selectedIndex]),
              ),
              drawer: const SideMenu(),
              body: PageView(
                controller: _pageController,
                children: _widgetOptions,
                onPageChanged: (index) {
                  _selectedIndex = index;
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.kitchen),
                    label: 'Pantry',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Shopping List',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant_menu),
                    label: 'Meal Plan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Alerts',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
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
