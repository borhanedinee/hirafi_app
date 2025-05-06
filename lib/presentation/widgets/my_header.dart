import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/core/themes/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
    required this.header,
    this.onViewAll,
    this.viewAll = true,
  });

  final String header;
  final bool viewAll;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          viewAll
              ? GestureDetector(
                  onTap: onViewAll,
                  child: TextButton(
                    onPressed: onViewAll,
                    child: Text(
                      AppLocalizations.of(context)!.viewAll,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
