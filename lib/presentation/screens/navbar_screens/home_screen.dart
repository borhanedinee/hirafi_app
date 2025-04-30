import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/widgets/home_screen/artisan/artisan_home_body.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/client_home_content.dart';
import 'package:hirafi/presentation/widgets/home_screen/home_appbar.dart';
import 'package:hirafi/presentation/shimmers/home_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: .8),
        drawer: const Drawer(),
        appBar: HomeAppBar(
          onMenuPressed: () {},
          onNotificationsPressed: () {},
        ),
        body: isLoading
            ? HomeShimmers()
            : Get.find<GlobalDataController>().isArtisan!
                ? ArtisanHomeContent()
                : ClientHomeContent(),
      ),
    );
  }
}
