import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/login_screen.dart';
import 'package:pantry_app/Widgets/side_menu.dart';
import 'package:pantry_app/Screens/notifications_screen.dart';

class AuthStreamBuilder extends StatefulWidget {
  const AuthStreamBuilder({
    Key? key,
    required this.widgetOptions,
    required this.pageTitleOptions,
  }) : super(key: key);

  final List<Widget> widgetOptions;
  final List<String> pageTitleOptions;

  static final globalKey = GlobalKey<AuthStreamBuilderState>();

  @override
  AuthStreamBuilderState createState() => AuthStreamBuilderState();
}

class AuthStreamBuilderState extends State<AuthStreamBuilder> {
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

  void rebuild() {
    setState(() {});
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
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Hero(
                  tag: 'appBar',
                  child: AppBar(
                    title: ValueListenableBuilder<int>(
                      valueListenable: _selectedIndex,
                      builder: (context, value, child) {
                        return Text(widget.pageTitleOptions[value]);
                      },
                    ),
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                const NotificationsScreen(),
                            barrierDismissible: false,
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionDuration: const Duration(milliseconds: 250),
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              return Stack(
                                children: [
                                  SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, -1),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                  Positioned(
                                    top: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: AppBar(
                                      automaticallyImplyLeading: false,
                                      title: const Text('Notifications'),
                                      centerTitle: true,
                                      actions: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              drawer: SideMenu(rebuild: rebuild),
              body: PageView(
                controller: _pageController,
                children: widget.widgetOptions,
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
                        icon: Icon(Icons.receipt),
                        label: 'Recipes',
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
                        icon: Icon(Icons.list),
                        label: 'Shopping Lists',
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
