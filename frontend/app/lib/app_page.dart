import 'package:app/features/history/presentation/screens/history_screen.dart';
import 'package:flutter/material.dart';
import "package:app/core/constants.dart";
import 'package:app/features/home/presentation/screens/home_screen.dart';
import 'package:app/features/profile/presentation/screens/profile_screen.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int currentPage = 0;
  final List<NavigationDestination> navButtons = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined, color: Colors.grey),
      selectedIcon: Icon(
        Icons.home,
        color: ColorConstants.basecolor,
      ),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined, color: Colors.grey),
      selectedIcon: Icon(Icons.calendar_month, color: ColorConstants.basecolor),
      label: "Appointments",
    ),
    NavigationDestination(
      icon: Icon(Icons.history_edu_outlined, color: Colors.grey),
      selectedIcon: Icon(Icons.history_edu, color: ColorConstants.basecolor),
      label: "History",
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined, color: Colors.grey),
      selectedIcon: Icon(Icons.person_2, color: ColorConstants.basecolor),
      label: "Profile",
    ),
  ];

  final List<Widget> pages = [
    const HomePage(),
    const Text("appointment"),
    // const AppointmentPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        height: 64,
        selectedIndex: currentPage,
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
        },

        backgroundColor: ColorConstants.cardBackground,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        overlayColor: WidgetStateProperty.all(Colors.transparent),

        destinations: navButtons,
      ),
    );
  }
}
