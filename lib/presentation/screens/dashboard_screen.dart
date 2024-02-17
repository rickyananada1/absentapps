import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';
import '../fragment/activity_fragment.dart';
import '../fragment/home_fragment.dart';
import '../fragment/profile_fragment.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    const HomeFragment(),
    const Scaffold(),
    const ActivityFragment(),
    const Scaffold(),
    const ProfileFragment(),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      child: Scaffold(
        bottomNavigationBar: _bottomTab(),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
    );
  }

  BottomNavigationBar _bottomTab() {
    return BottomNavigationBar(
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
    );
  }
}
