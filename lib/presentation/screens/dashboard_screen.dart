import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/colors.dart';
import '../fragment/activity_fragment.dart';
import '../fragment/home_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _fragments = [
    const HomeFragment(),
    const Scaffold(),
    const ActivityFragment(),
    const Scaffold(),
    const Scaffold(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _fragments[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.grey),
              label: 'Beranda',
              activeIcon: Icon(Icons.home_outlined, color: appColorPrimary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_outlined, color: Colors.grey),
              label: 'Jadwal',
              activeIcon: Icon(Icons.alarm_outlined, color: appColorPrimary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined, color: Colors.grey),
              label: 'Aktivitas',
              activeIcon:
                  Icon(Icons.calendar_month_outlined, color: appColorPrimary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined, color: Colors.grey),
              label: 'Notifikasi',
              activeIcon:
                  Icon(Icons.notifications_outlined, color: appColorPrimary),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              label: 'Profil',
              activeIcon: Icon(FontAwesomeIcons.user, color: appColorPrimary),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: appColorPrimary,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          // type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
