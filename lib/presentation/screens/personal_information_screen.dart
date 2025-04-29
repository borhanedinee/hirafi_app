import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.personalInfoScreen_title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                // HEADER
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    l10n.personalInfoScreen_manageInfo,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),

                //PROFILE AVATAR
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/avatars/client_avatar.jpg',
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton.filled(
                          icon: Icon(
                            Icons.camera_alt,
                            color: AppColors.whiteColor,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 32,
                ),

                // First name
                MyFieldHeader(headingText: l10n.personalInfoScreen_firstName),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '',
                  initialValue: 'Borhanedine',
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(height: 16),

                // Second Name
                MyFieldHeader(headingText: l10n.personalInfoScreen_secondName),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '',
                  initialValue: 'Boussaha',
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(height: 16),

                // INFORMATION FIELDS
                MyFieldHeader(
                    headingText: l10n.personalInfoScreen_emailAddress),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '',
                  initialValue: 'borhanedine@gmail.com',
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(height: 16),

                // INFORMATION FIELDS
                MyFieldHeader(
                  headingText: l10n.personalInfoScreen_phoneNumber,
                ),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '',
                  initialValue: '+213 664656525',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(height: 32),

                // SAVE BUTTON
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        l10n.personalInfoScreen_saveChanges,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Divider(
                  color: AppColors.greyColor,
                  thickness: 1,
                ),
                SizedBox(height: 16),

                // change password button
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.blackColor),
                        ),
                        backgroundColor: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.lock,
                        color: AppColors.blackColor,
                        size: 14,
                      ),
                      label: Text(
                        l10n.personalInfoScreen_changePassword,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.blackColor,
                            ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // DELETE ACCOUNT BUTTON
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.red),
                        ),
                        backgroundColor: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      label: Text(
                        l10n.personalInfoScreen_deleteAccount,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
