import 'package:flutter/material.dart';
import 'package:hockey_quiz/base/app_theme.dart';

class VictorineAnswerItem extends StatelessWidget {
  const VictorineAnswerItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isRight,
    required this.index,
  });

  final int index;
  final String title;
  final VoidCallback onTap;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(bottom: 8),
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        color: isRight ? context.theme.primaryColor : AppTheme.greyL,
        child: Row(
          children: [
            const SizedBox(width: 24),
            Text(
              indexToLetter,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: isRight ? Colors.white : AppTheme.greyD),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isRight ? Colors.white : AppTheme.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            AnimatedCicrleCheck(show: isRight),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  String get indexToLetter {
    switch (index) {
      case 0:
        return 'A';

      case 1:
        return 'B';

      case 2:
        return 'C';
    }

    return 'A';
  }
}

class AnimatedCicrleCheck extends StatefulWidget {
  const AnimatedCicrleCheck({super.key, required this.show});
  final bool show;

  @override
  State<AnimatedCicrleCheck> createState() => _AnimatedCicrleCheckState();
}

class _AnimatedCicrleCheckState extends State<AnimatedCicrleCheck>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = Tween<double>(begin: 0, end: 24).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedCicrleCheck oldWidget) {
    if (oldWidget.show == widget.show) {
      return;
    }

    if (widget.show) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox.square(
          dimension: 24,
          child: UnconstrainedBox(child: CircleCheck(size: _animation.value)),
        );
      },
    );
  }
}

class CircleCheck extends StatelessWidget {
  const CircleCheck({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Color(0xFFfa6666),
        shape: BoxShape.circle,
      ),
      child: const FittedBox(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
