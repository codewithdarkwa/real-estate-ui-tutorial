import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            icon: Icons.home_filled,
            label: 'Home',
            isActive: true,
            onTap: (){},
          ),
          NavBarItem(
            icon: Icons.chat,
            label: 'Chat',
            isActive: false,
            onTap: (){},
          ),
          NavBarItem(
            icon: Icons.bookmark_outline,
            label: 'Bookmark',
            isActive: false,
            onTap: (){},
          ),
          NavBarItem(
            icon: Icons.person_outline,
            label: 'Profile',
            isActive: false,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.icon, required this.label, required this.isActive, required this.onTap});

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isActive ? Theme.of(context).primaryColor : const Color(0xff5d5d61),
            child: Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
