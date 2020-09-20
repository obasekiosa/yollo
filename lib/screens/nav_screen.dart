import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yollo/config/config.dart';
import 'package:yollo/screens/screens.dart';

class NavScreen extends StatefulWidget {
  static const String id = 'nav_screen';
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    MdiIcons.homeOutline,
    Icons.add_circle_outline,
    Icons.mail_outline,
    Icons.person_outline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          backgroundColor: Palette.kPurpleAccent,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: TabBar(
            indicatorColor: Colors.transparent,
            tabs: _icons.asMap().map(
                  (index, icon) => MapEntry(
                    index,
                    Tab(
                      icon: Icon(
                        icon,
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.deepPurple,
                        size: 25.0,
                      ),
                    ),
                  ),
                ).values.toList(),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
