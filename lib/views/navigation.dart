import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../screens/home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      body: currentIndex == 0 ? const HomeScreen() : null,
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 25.0,
        selectedColor: Colors.white,
        strokeColor: Colors.white,
        unSelectedColor: Colors.grey[600],
        backgroundColor: Colors.black,
        borderRadius: const Radius.circular(20.0),
        blurEffect: true,
        opacity: 0.8,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(EvaIcons.homeOutline),
            selectedIcon: const Icon(EvaIcons.home),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              EvaIcons.menu,
            ),
            selectedIcon: const Icon(
              EvaIcons.menu,
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (currentIndex == 1) {
            showMaterialModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GlassmorphicContainer(
                  width: double.maxFinite,
                  height: 350,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: null,
                ),
              ),
            );
          }
        },
        isFloating: true,
      ),
    );
  }
}
