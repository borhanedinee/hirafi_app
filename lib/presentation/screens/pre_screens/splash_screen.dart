import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/pre_screens/user_type_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Total duration of the animation
    );

    // Fade Animation for the Logo (0 to 1 over the first 1 second)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Scale Animation for the Logo (1 to 1.1 over the first 1 second)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Fade Animation for the Text (0 to 1 with a delay, starting after 0.5 seconds)
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start the animation
    _controller.forward();

    // Navigate to UserTypeScreen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserTypeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with Fade and Scale Animation
                  Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Hero(
                        tag: 'logo-animation',
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/logos/logo1.png',
                            width: size.width * 0.5,
                            height: size.height * 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // App Name with Fade Animation
                  Opacity(
                    opacity: _textFadeAnimation.value,
                    child: Text(
                      'Herrafi',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                                fontSize: 32,
                              ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tagline with Fade Animation
                  Opacity(
                    opacity: _textFadeAnimation.value,
                    child: Text(
                      'Crafting Connections',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.greyColor.withOpacity(0.8),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
