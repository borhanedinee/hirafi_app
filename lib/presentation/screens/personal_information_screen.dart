import 'package:flutter/material.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Information',
          style: TextStyle(
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
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    'Manage your personal information here.',
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
                            width: 150,
                            height: 150,
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

                // INFORMATION FIELDS
                MyFieldHeader(headingText: 'Full name'),
                SizedBox(height: 8),
                MyTextField(
                  hintText: 'Boussaha Borhanedine',
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 16),

                // INFORMATION FIELDS
                MyFieldHeader(headingText: 'Email address'),
                SizedBox(height: 8),
                MyTextField(
                  hintText: 'borhanedine@gmail.com',
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 16),

                // INFORMATION FIELDS
                MyFieldHeader(
                  headingText: 'Phone number',
                ),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '+213 664656525',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 16),

                // INFORMATION FIELDS
                MyFieldHeader(headingText: 'Password'),
                SizedBox(height: 8),
                MyTextField(
                  hintText: '*********',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),

                SizedBox(height: 32),

                // SAVE BUTTON
                Container(
                  width: MediaQuery.of(context).size.width - 50,
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
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // DELETE ACCOUNT BUTTON
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: ElevatedButton(
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
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(
                        fontSize: 16,
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
