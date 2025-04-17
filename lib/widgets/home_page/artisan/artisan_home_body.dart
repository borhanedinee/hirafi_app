import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/widgets/home_page/artisan/widgets/artisan_control_card.dart';
import 'package:hirafi/widgets/home_page/artisan/widgets/client_direct_offer_item.dart';
import 'package:hirafi/widgets/home_page/client/widgets/home_seacrhbar.dart';
import 'package:hirafi/widgets/my_header.dart';

class ArtisanHomeContent extends StatelessWidget {
  const ArtisanHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          const CustomSearchBar(),
          const SizedBox(height: 20),

          // ARTISAN CONTROL CARD
          ArtisanControlCard(),

          SizedBox(height: 16),

          // ARTISAN DIRECT OFFERS SENT BY CLIENTS
          MyHeader(header: 'Direct Offers'),
          Column(
            spacing: 8,
            children: List.generate(
              2,
              (index) => ClientDirectOfferItem(
                onAccept: () {},
                onReject: () {},
              ),
            ),
          ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
