import 'package:material_ui/material_ui.dart';
import 'package:space_app/features/details/planets_details_screen.dart';
import 'package:space_app/features/welcome/welcome_screen.dart';
import 'package:space_app/features/home/home_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PlanetsDetailsScreen.routeName: (context) =>
            const PlanetsDetailsScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
