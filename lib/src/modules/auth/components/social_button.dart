import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final Color color;
  final IconData icon;
  final void Function() onTap;

  const SocialButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<Alignment> animationChildAlignment;

  _onTap() {
    _animationController.forward().whenComplete(() {
      _animationController.reverse();
    });
    widget.onTap();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    animationChildAlignment =
        Tween<Alignment>(begin: Alignment.center, end: Alignment.topCenter)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
      ),
    );

    _animationController.forward().whenComplete(() {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 69,
        height: 69,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: animationChildAlignment.value,
          child: Icon(
            widget.icon,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
