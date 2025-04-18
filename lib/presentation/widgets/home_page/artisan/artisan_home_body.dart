import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/presentation/widgets/home_page/artisan/widgets/artisan_control_card.dart';
import 'package:hirafi/presentation/widgets/home_page/artisan/widgets/client_direct_offer_item.dart';
import 'package:hirafi/presentation/widgets/home_page/artisan/widgets/offer_by_tender_item.dart';
import 'package:hirafi/presentation/widgets/home_page/home_seacrhbar.dart';
import 'package:hirafi/presentation/widgets/my_header.dart';

class ArtisanHomeContent extends StatelessWidget {
  const ArtisanHomeContent({super.key, required this.isArtisan});
  final bool isArtisan;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          const CustomSearchBar(
            isArtisan: true,
          ),
          const SizedBox(height: 20),

          // ARTISAN CONTROL CARD
          ArtisanControlCard(),

          SizedBox(height: 16),

          // ARTISAN DIRECT OFFERS SENT BY CLIENTS
          MyHeader(header: 'Direct Offers'),
          Column(
            spacing: 16,
            children: List.generate(
              2,
              (index) => ClientDirectOfferItem(
                onAccept: () {},
                onReject: () {},
              ),
            ),
          ),
          const SizedBox(height: 16),

          // OFFERS BY TENDER
          MyHeader(header: 'Offers by Tender'),

          Column(
            spacing: 16,
            children: List.generate(
              2,
              (index) => OfferByTenderItem(
                onBookmark: () {},
                onSendProposal: () {},
              ),
            ),
          ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
