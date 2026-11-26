import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/utils/app_colors.dart';

abstract class AppStyles {
  static const white48Bold = TextStyle(
    color: AppColors.white,
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
  static const white20SemiBold = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const white24Bold = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const white16Bold = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const white16Regular = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
