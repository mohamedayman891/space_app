import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/utils/app_assets.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/features/home/home_screen.dart';
import 'package:space_app/features/home/widget/explore_button.dart';
import 'package:space_app/core/utils/app_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String routeName = "welcomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(Assets.universe, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Explore\nThe\nUniverse ",
                style: AppStyles.white48Bold,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ExploreButton(
              text: "Explore",
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
