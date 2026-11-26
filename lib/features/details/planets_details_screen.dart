import 'package:material_ui/material_ui.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/models/planets_dm.dart';
import 'package:space_app/core/utils/app_assets.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_styles.dart';
import 'package:space_app/features/home/widget/routing_button.dart';

class PlanetsDetailsScreen extends StatefulWidget {
  const PlanetsDetailsScreen({super.key});
  static String routeName = "PlanetsDetailsScreen";
  @override
  State<PlanetsDetailsScreen> createState() => _PlanetsDetailsScreenState();
}

class _PlanetsDetailsScreenState extends State<PlanetsDetailsScreen> {
  Flutter3DController controller = Flutter3DController();

  void _onModelLoaded() {
    if (controller.onModelLoaded.value) {
      controller.startRotation(rotationSpeed: 15);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.onModelLoaded.addListener(_onModelLoaded);
  }

  @override
  void dispose() {
    controller.onModelLoaded.removeListener(_onModelLoaded);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var planetsDetails =
        ModalRoute.of(context)!.settings.arguments as PlanetsDM;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          toolbarHeight: height * 0.15,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(Assets.exploreUniverse, fit: BoxFit.cover),
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
                    planetsDetails.name,
                    style: AppStyles.white24Bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    planetsDetails.title,
                    style: AppStyles.white24Bold,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: RoutingButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.3,
                  child: Flutter3DViewer(
                    controller: controller,
                    src: planetsDetails.model3D,
                    enableTouch: true,
                    activeGestureInterceptor: true,
                    progressBarColor: AppColors.transparent,
                    onLoad: (model) {
                      debugPrint("Loaded: $model");
                    },
                    onError: (error) {
                      debugPrint("3d error $error");
                    },
                  ),
                ),
                Row(children: [Text("About", style: AppStyles.white24Bold)]),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 15),
                  child: Text(
                    planetsDetails.about,
                    style: AppStyles.white16Regular,
                  ),
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Distance from Sun (km) : ${planetsDetails.distanceFromSun}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Length of Day (hours) : ${planetsDetails.lengthOfDay}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Orbital Period (Earth years) : ${planetsDetails.orbitalPeriod}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Radius (km) : ${planetsDetails.radius}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Mass (kg) : ${planetsDetails.mass}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Gravity (m/s²) : ${planetsDetails.gravity}",
                      style: AppStyles.white16Bold,
                    ),
                    Text(
                      "Surface Area (km²) : ${planetsDetails.surfaceArea}",
                      style: AppStyles.white16Bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
