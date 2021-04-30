import 'package:flutter/material.dart';
import 'package:foodcraft/interfaces/navigation.dart';
import 'package:foodcraft/pages/dashboard.dart';
import 'package:foodcraft/pages/navigation/navigation_notifier.dart';
import 'package:foodcraft/pages/notification.dart';
import 'package:foodcraft/pages/reservation.dart';
import 'package:foodcraft/pages/restaurant.dart';
import 'package:foodcraft/pages/setting.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  final NavigationNotifier _navigationNotifier = new NavigationNotifier();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _navigationNotifier,
      child: Consumer<NavigationNotifier>(
        builder: (context, navigation, child) {
          return _Navigation(
            selectedIndex: navigation.getIndex(),
            notifier: _navigationNotifier,
          );
        },
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  final int selectedIndex;
  final NavigationNotifier notifier;

  final List<NavigationInterface> items = [
    NavigationInterface(
      'Restaurant',
      Icon(Icons.restaurant_menu),
      RestaurantPage(),
    ),
    NavigationInterface(
      'Notification',
      Icon(Icons.notifications),
      NotificationPage(),
    ),
    NavigationInterface(
      'Dashboard',
      Icon(Icons.home),
      DashboardPage(),
    ),
    NavigationInterface(
      'Reservation',
      Icon(Icons.receipt),
      ReservationPage(),
    ),
    NavigationInterface(
      'Setting',
      Icon(Icons.settings),
      SettingPage(),
    ),
  ];

  _Navigation({Key? key, required this.selectedIndex, required this.notifier})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[this.selectedIndex].content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        items: items
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
        onTap: (index) => notifier.setIndex(index),
      ),
    );
  }
}
