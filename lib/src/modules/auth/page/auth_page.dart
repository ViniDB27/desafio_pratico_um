import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/animated_logo.dart';
import '../components/social_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> animationButtonReact;
  late final Animation<double> animationEntryOpacity;
  late final Animation<double> animationLoadingOpacity;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    animationButtonReact = Tween<double>(begin: 125, end: 43).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.easeOut,
      ),
    );

    animationEntryOpacity =
        Tween<double>(begin: 1, end: 0).animate(_animationController);

    animationLoadingOpacity =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  _onSubmit() {
    isLoading = !isLoading;
    if (isLoading) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 100),
            height: mediaQuery.size.height - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  height: 150,
                  child: AnimatedLogo(),
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text('Senha'),
                  ),
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _onSubmit,
                      child: Container(
                        width: animationButtonReact.value,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(21.5),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (isLoading)
                              Opacity(
                                opacity: animationLoadingOpacity.value,
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            if (!isLoading)
                              Opacity(
                                opacity: animationEntryOpacity.value,
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  width: 155,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      color: const Color(0xFFEA4335),
                      icon: FontAwesomeIcons.google,
                      onTap: () {},
                    ),
                    SocialButton(
                      color: const Color(0xFF1977F3),
                      icon: Icons.facebook,
                      onTap: () {},
                    ),
                    SocialButton(
                      color: const Color(0xFF000000),
                      icon: Icons.apple,
                      onTap: () {},
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Copyright © Masterclass 2022'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
