import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/presentation/widgets/home_screen/artisan/widgets/artisan_control_card.dart';
import 'package:hirafi/presentation/widgets/home_screen/artisan/widgets/client_direct_offer_item.dart';
import 'package:hirafi/presentation/widgets/home_screen/artisan/widgets/offer_by_tender_item.dart';
import 'package:hirafi/presentation/widgets/home_screen/home_seacrhbar.dart';
import 'package:hirafi/presentation/widgets/my_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Added for localization

class ArtisanHomeContent extends StatelessWidget {
  const ArtisanHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: constraints.maxHeight,
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              CustomSearchBar(),
              const SizedBox(height: 20),

              // ARTISAN CONTROL CARD
              ArtisanControlCard(),

              SizedBox(height: 16),

              // ARTISAN DIRECT OFFERS SENT BY CLIENTS
              MyHeader(
                  header: AppLocalizations.of(context)!
                      .artisanHomeContent_directOffers),
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
              MyHeader(
                  header: AppLocalizations.of(context)!
                      .artisanHomeContent_offersByTender),

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
        ),
      ),
    );
  }
}
