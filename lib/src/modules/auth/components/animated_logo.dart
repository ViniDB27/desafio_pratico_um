import 'package:flutter/material.dart';

import '../../../shared/theme/app_images.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _logoAnimationController;

  late final Animation<double> animationLogo;

  @override
  void initState() {
    super.initState();

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _logoAnimationController.addListener(() {
      setState(() {});
    });

    animationLogo =
        Tween<double>(begin: 360, end: 0).animate(_logoAnimationController);

    _logoAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(animationLogo.value / 360),
      child: Image.asset(
        AppImages.logo,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
