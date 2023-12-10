import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';

class VictorineAppBar extends StatelessWidget implements PreferredSize {
  const VictorineAppBar({super.key, required this.title, this.style});
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: UnconstrainedBox(
          child: SvgPicture.asset('images/back_arrow.svg'),
        ),
      ),
      title: Text(
        title,
        style: style ??
            const TextStyle(
              color: AppTheme.black,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
