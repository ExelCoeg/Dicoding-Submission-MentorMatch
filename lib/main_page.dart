import 'package:flutter/material.dart';
import 'main.dart';
import 'mentor_data.dart';
import 'article_data.dart';
import 'home_page.dart';
import 'mentors_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(
            currentPageIndex: _currentPageIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            }),
        body: <Widget>[HomePage(),MentorPage()
        ][_currentPageIndex]
    );
  }
}



class CustomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar(
      {super.key,
        required this.currentPageIndex,
        required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border(top: BorderSide(color: Colors.grey))),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
        child: NavigationBar(
          indicatorColor: primaryColor,
          backgroundColor: onBackgroundColor,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            _NavItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home_outlined,
                label: 'Home',
                isSelected: currentPageIndex == 0,
                onTap: () => onDestinationSelected(0)),
            _NavItem(
                icon: Icons.search,
                selectedIcon: Icons.search,
                label: 'Mentors',
                isSelected: currentPageIndex == 1,
                onTap: () => onDestinationSelected(1)),
            // _NavItem(
            //     icon: Icons.person_outline,
            //     selectedIcon: Icons.person_outline,
            //     label: 'Profile',
            //     isSelected: currentPageIndex == 2,
            //     onTap: () => onDestinationSelected(2)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isSelected ? 50 : 30,
            height: isSelected ? 50 : 30,
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? selectedIcon : icon,
                key: ValueKey(isSelected),
                color: isSelected ? onBackgroundColor : Colors.grey,
                size: 24,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? primaryColor : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
