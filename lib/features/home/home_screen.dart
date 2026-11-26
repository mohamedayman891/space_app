import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/models/planets_dm.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_styles.dart';
import 'package:space_app/features/details/planets_details_screen.dart';
import 'package:space_app/features/home/widget/routing_button.dart';
import 'package:space_app/features/home/widget/explore_button.dart';
import 'package:space_app/features/home/widget/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page! % 1 == 0) {
        currentIndex = pageController.page!.toInt();
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: HomeHeader(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              SizedBox(
                height: height * 0.45,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  // itemCount: PlanetsDM.planetsDetailsList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      PlanetsDM.planetsDetailsList[currentIndex % 9].image,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoutingButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      pageController.animateToPage(
                        currentIndex - 1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  Text(
                    PlanetsDM.planetsDetailsList[currentIndex % 9].name,
                    style: AppStyles.white24Bold,
                  ),
                  RoutingButton(
                    icon: Icons.arrow_forward,
                    onTap: () {
                      pageController.animateToPage(
                        currentIndex + 1,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              ExploreButton(
                text:
                    "Explore ${PlanetsDM.planetsDetailsList[currentIndex % 9].name}",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PlanetsDetailsScreen.routeName,
                    arguments: PlanetsDM.planetsDetailsList[currentIndex % 9],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
