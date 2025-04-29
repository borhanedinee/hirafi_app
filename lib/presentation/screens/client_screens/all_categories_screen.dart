import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hirafi/presentation/screens/home_sub_screens/profiles_screen.dart';
import 'package:hirafi/presentation/screens/home_sub_screens/sub_categories_screen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    // List of categories with their localized keys and corresponding icons
    final categories = [
      {'key': 'electricity', 'icon': Icons.electrical_services},
      {'key': 'plumbing', 'icon': Icons.plumbing},
      {'key': 'carpentry', 'icon': Icons.carpenter},
      {'key': 'ironwork', 'icon': Icons.hardware},
      {'key': 'aluminumAndGlass', 'icon': Icons.window},
      {'key': 'paintingAndDecoration', 'icon': Icons.format_paint},
      {'key': 'gypsumAndFinishing', 'icon': Icons.construction},
      {'key': 'airConditioningAndRefrigeration', 'icon': Icons.ac_unit},
      {'key': 'constructionAndContracting', 'icon': Icons.build},
      {'key': 'ceramicsAndTiling', 'icon': Icons.grid_4x4},
      {'key': 'gardeningAndLandscaping', 'icon': Icons.grass},
      {'key': 'cleaning', 'icon': Icons.cleaning_services},
      {'key': 'electronicsAndTechnology', 'icon': Icons.devices},
      {'key': 'curtainsAndShades', 'icon': Icons.curtains},
      {'key': 'homeAppliancesRepair', 'icon': Icons.kitchen},
      {'key': 'movingAndAssembly', 'icon': Icons.move_to_inbox},
      {'key': 'elevatorMaintenance', 'icon': Icons.elevator},
      {'key': 'interiorAndExteriorDesign', 'icon': Icons.design_services},
      {'key': 'thermalAndWaterproofing', 'icon': Icons.water_damage},
      {'key': 'securityAndControlServices', 'icon': Icons.security},
      {'key': 'waterTanks', 'icon': Icons.water},
      {'key': 'outdoorAndIndoorGamesMaintenance', 'icon': Icons.sports},
      {'key': 'alternativeEnergySystems', 'icon': Icons.solar_power},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.allCategoriesScreen_title,
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final categoryKey = category['key'] as String;
            final icon = category['icon'] as IconData;

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesScreen(
                        clickedCategory: categoryKey,
                        index: index,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      localizations.artisanServices_category(categoryKey),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Extension to access localized category names (same as previous response)
extension AppLocalizationsX on AppLocalizations {
  String artisanServices_category(String category) {
    switch (category) {
      case 'electricity':
        return artisanServices_category_electricity;
      case 'plumbing':
        return artisanServices_category_plumbing;
      case 'carpentry':
        return artisanServices_category_carpentry;
      case 'ironwork':
        return artisanServices_category_ironwork;
      case 'aluminumAndGlass':
        return artisanServices_category_aluminumAndGlass;
      case 'paintingAndDecoration':
        return artisanServices_category_paintingAndDecoration;
      case 'gypsumAndFinishing':
        return artisanServices_category_gypsumAndFinishing;
      case 'airConditioningAndRefrigeration':
        return artisanServices_category_airConditioningAndRefrigeration;
      case 'constructionAndContracting':
        return artisanServices_category_constructionAndContracting;
      case 'ceramicsAndTiling':
        return artisanServices_category_ceramicsAndTiling;
      case 'gardeningAndLandscaping':
        return artisanServices_category_gardeningAndLandscaping;
      case 'cleaning':
        return artisanServices_category_cleaning;
      case 'electronicsAndTechnology':
        return artisanServices_category_electronicsAndTechnology;
      case 'curtainsAndShades':
        return artisanServices_category_curtainsAndShades;
      case 'homeAppliancesRepair':
        return artisanServices_category_homeAppliancesRepair;
      case 'movingAndAssembly':
        return artisanServices_category_movingAndAssembly;
      case 'elevatorMaintenance':
        return artisanServices_category_elevatorMaintenance;
      case 'interiorAndExteriorDesign':
        return artisanServices_category_interiorAndExteriorDesign;
      case 'thermalAndWaterproofing':
        return artisanServices_category_thermalAndWaterproofing;
      case 'securityAndControlServices':
        return artisanServices_category_securityAndControlServices;
      case 'waterTanks':
        return artisanServices_category_waterTanks;
      case 'outdoorAndIndoorGamesMaintenance':
        return artisanServices_category_outdoorAndIndoorGamesMaintenance;
      case 'alternativeEnergySystems':
        return artisanServices_category_alternativeEnergySystems;
      default:
        return category;
    }
  }
}
