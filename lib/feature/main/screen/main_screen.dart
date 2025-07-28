import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: ListenableBuilder(
        listenable: MainSources.currentPage,
        builder: (context, child) {
          return BottomNavigationBar(
            currentIndex: MainSources.currentPage.value,
            onTap: (index) async {
              MainSources.currentPage.value = index;
              widget.navigationShell.goBranch(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.home,
                  height: 24,
                  color:
                      MainSources.currentPage.value == 0
                          ? Colors.black
                          : Colors.grey,
                ),
                label: "home".tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.category,
                  height: 24,
                  color:
                      MainSources.currentPage.value == 1
                          ? Colors.black
                          : Colors.grey,
                ),
                label: "category".tr(),
              ),
              BottomNavigationBarItem(
                icon: BlocBuilder<CardBloc, CardState>(
                  builder: (context, state) {
                    var count = state.whenOrNull(
                      success: (data, _) => data.length,
                    );
                    return badges.Badge(
                      showBadge: count != null && count > 0,
                      badgeContent: Text(
                        count.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      badgeAnimation: badges.BadgeAnimation.scale(),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.red,
                      ),
                      child: SvgPicture.asset(
                        AppImages.card,
                        height: 24,
                        color:
                            MainSources.currentPage.value == 2
                                ? Colors.black
                                : Colors.grey,
                      ),
                    );
                  },
                ),

                label: "card".tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  size: 24,
                  color:
                      MainSources.currentPage.value == 3
                          ? Colors.black
                          : Colors.grey,
                ),
                label: "order".tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profile,
                  height: 24,
                  color:
                      MainSources.currentPage.value == 4
                          ? Colors.black
                          : Colors.grey,
                ),
                label: "profile".tr(),
              ),
            ],
          );
        },
      ),
    );
  }
}
