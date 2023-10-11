import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';
import 'package:nuntium_news_app/ui/screens/bookmarks_screen.dart';
import 'package:nuntium_news_app/ui/screens/categories_screen.dart';
import 'package:nuntium_news_app/ui/screens/home_screen.dart';
import 'package:nuntium_news_app/ui/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activePageIndex = 0;

  final height = 56.0;
  final List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    BookmarksScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activePageIndex],
      bottomNavigationBar: _NuntiumBottomNavigationBar(
        onSelectItem: (newIndex) {
          setState(() => activePageIndex = newIndex);
        },
      ),
    );
  }
}

class _NuntiumBottomNavigationBar extends StatefulWidget {
  const _NuntiumBottomNavigationBar({required this.onSelectItem});

  final ValueChanged<int> onSelectItem;

  @override
  State<_NuntiumBottomNavigationBar> createState() =>
      _NuntiumBottomNavigationBarState();
}

class _NuntiumBottomNavigationBarState
    extends State<_NuntiumBottomNavigationBar> {
  int activePageIndex = 0;

  final height = 56.0;
  final List<String> iconPaths = [
    NuntiumSVGIconData.estate,
    NuntiumSVGIconData.apps,
    NuntiumSVGIconData.bookmark,
    NuntiumSVGIconData.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: const BorderRadius.only(
          topLeft: RadiusConstants.circularDefault,
          topRight: RadiusConstants.circularDefault,
        ),
        border: Border.all(color: ColorConstants.greyLight),
      ),
      child: Row(
        children: List.generate(
          iconPaths.length,
          buildItem,
        ),
      ),
    );
  }

  Expanded buildItem(int index) {
    return Expanded(
      child: NuntiumInkWell(
        onTap: () {
          setState(() => activePageIndex = index);
          widget.onSelectItem(index);
        },
        child: SizedBox(
          height: height,
          child: Center(
            child: NuntiumSvgIcon(
              iconPaths[index],
              color: activePageIndex == index
                  ? ColorConstants.purplePrimary
                  : ColorConstants.greyLight,
            ),
          ),
        ),
      ),
    );
  }
}
