import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/utils/app_assets.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_styles.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});
  static const double _height = 200;
  @override
  Size get preferredSize => Size.fromHeight(_height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _height,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.exploreUniverse, fit: BoxFit.fill),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.transparent, AppColors.black],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Text(
              "Explore",
              style: AppStyles.white24Bold,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Which planet\nwould you like to explore?",
                style: AppStyles.white24Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
