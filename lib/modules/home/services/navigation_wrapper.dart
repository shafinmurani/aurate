import 'package:aurate/export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  //TODO: Add screens here when updated
  List<Widget> screens = [Homescreen(), Placeholder(), ProfileScreen()];
  int widgetIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            widgetIndex = index;
          });
        },
        currentIndex: widgetIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Provider.of<ThemeProvider>(context).mainColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Provider.of<ThemeProvider>(context).mainColor,
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Provider.of<ThemeProvider>(context).mainColor,
              ),
              label: "Profile"),
        ],
      ),
      body: screens[widgetIndex],
    );
  }
}
