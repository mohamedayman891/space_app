import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/utils/app_colors.dart';

class RoutingButton extends StatelessWidget {
  const RoutingButton({super.key, this.onTap, this.icon});
  final Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.red),
        child: Icon(icon, color: AppColors.white, size: 24),
      ),
    );
  }
}
