import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map> navigatorItems = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Category", "icon": Icons.category_outlined},
    {"name": "Card", "icon": Icons.shopping_cart_outlined},
    {"name": "Orders", "icon": Icons.bookmark_border_outlined},
    {"name": "Profile", "icon": Icons.person_outline},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Row(
            spacing: 3,
            children: [
              ...List.generate(navigatorItems.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.navigationShell.goBranch(index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Icon(
                            navigatorItems[index]["icon"],
                            color:
                                widget.navigationShell.currentIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          Text(
                            navigatorItems[index]["name"],
                            style: TextStyle(
                              color:
                                  widget.navigationShell.currentIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
