import 'package:material_ui/material_ui.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_styles.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor:AppColors.red ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppStyles.white20SemiBold),
            Icon(Icons.arrow_forward, color: AppColors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
