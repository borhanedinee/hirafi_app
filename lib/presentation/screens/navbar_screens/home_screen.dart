import 'package:flutter/material.dart';
import 'package:hirafi/presentation/widgets/home_page/artisan/artisan_home_body.dart';
import 'package:hirafi/presentation/widgets/home_page/client/client_home_content.dart';
import 'package:hirafi/presentation/widgets/home_page/home_appbar.dart';
import 'package:hirafi/presentation/shimmers/home_shimmer.dart';

class HomeScreen extends StatefulWidget {
  final bool isArtisan;
  const HomeScreen({super.key, required this.isArtisan});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .8),
      drawer: const Drawer(),
      appBar: HomeAppBar(
        isArtisan: widget.isArtisan,
        onMenuPressed: () {},
        onNotificationsPressed: () {},
      ),
      body: isLoading
          ? HomeShimmers(isArtisan: widget.isArtisan)
          : widget.isArtisan
              ? ArtisanHomeContent(isArtisan: widget.isArtisan)
              : ClientHomeContent(),
    );
  }
}
