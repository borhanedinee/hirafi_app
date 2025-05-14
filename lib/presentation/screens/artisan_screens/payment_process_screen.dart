import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/core/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class PaymentProcessScreen extends StatefulWidget {
  final String packageName;
  final double price;

  const PaymentProcessScreen({
    Key? key,
    required this.packageName,
    required this.price,
  }) : super(key: key);

  @override
  State<PaymentProcessScreen> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  String? _selectedPaymentMethod;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final FocusNode _cardNumberFocus = FocusNode();
  final FocusNode _expiryFocus = FocusNode();
  final FocusNode _cvvFocus = FocusNode();
  String? _cardNumberError;
  String? _expiryError;
  String? _cvvError;
  bool _isLoading = false;

  // Sample payment methods (consistent with PaymentMethodsScreen)
  List<Map<String, dynamic>> get paymentMethods {
    final l10n = AppLocalizations.of(context)!;
    return [
      {
        'name': l10n.paymentProcessScreen_cibCard,
        'description': l10n.paymentProcessScreen_cibCardDescription,
        'icon': 'assets/icons/cib_card.png',
      },
      {
        'name': l10n.paymentProcessScreen_edahabia,
        'description': l10n.paymentProcessScreen_edahabiaDescription,
        'icon': 'assets/icons/edahabiya_card.png',
      },
    ];
  }

  @override
  void initState() {
    super.initState();
    // Add listeners for real-time validation
    _cardNumberController.addListener(_validateCardNumber);
    _expiryController.addListener(_validateExpiry);
    _cvvController.addListener(_validateCvv);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardNumberFocus.dispose();
    _expiryFocus.dispose();
    _cvvFocus.dispose();
    super.dispose();
  }

  void _validateCardNumber() {
    final l10n = AppLocalizations.of(context)!;
    final value = _cardNumberController.text.replaceAll(' ', '');
    setState(() {
      _cardNumberError = value.length == 16 && RegExp(r'^\d+$').hasMatch(value)
          ? null
          : l10n.paymentProcessScreen_invalidCardNumber;
    });
  }

  void _validateExpiry() {
    final l10n = AppLocalizations.of(context)!;
    final value = _expiryController.text;
    if (value.isEmpty) {
      setState(() {
        _expiryError = l10n.paymentProcessScreen_invalidExpiry;
      });
      return;
    }
    try {
      final now = DateTime.now();
      final formatter = DateFormat('MM/yy');
      final expiryDate = formatter.parse(value);
      if (expiryDate.isAfter(now)) {
        setState(() {
          _expiryError = null;
        });
      } else {
        setState(() {
          _expiryError = l10n.paymentProcessScreen_invalidExpiry;
        });
      }
    } catch (e) {
      setState(() {
        _expiryError = l10n.paymentProcessScreen_invalidExpiry;
      });
    }
  }

  void _validateCvv() {
    final l10n = AppLocalizations.of(context)!;
    final value = _cvvController.text;
    setState(() {
      _cvvError = value.length == 3 && RegExp(r'^\d+$').hasMatch(value)
          ? null
          : l10n.paymentProcessScreen_invalidCvv;
    });
  }

  bool get _isFormValid {
    if (_selectedPaymentMethod == null) return false;
    if (_selectedPaymentMethod != 'new_card') return true;
    return _cardNumberError == null &&
        _expiryError == null &&
        _cvvError == null &&
        _cardNumberController.text.isNotEmpty &&
        _expiryController.text.isNotEmpty &&
        _cvvController.text.isNotEmpty;
  }

  void _confirmPayment(BuildContext context, AppLocalizations l10n) async {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.paymentProcessScreen_selectMethod)),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate payment processing with delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(width: 8),
            Text(l10n.paymentProcessScreen_paymentSuccess),
          ],
        ),
        content: Text(
          l10n.paymentProcessScreen_paymentSuccessMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => NavBarRootScreen(),
                ),
                (route) => false,
              );
            },
            child: Text(
              l10n.paymentProcessScreen_okButton,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.paymentProcessScreen_title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    l10n.paymentProcessScreen_completePayment,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.paymentProcessScreen_subheader,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                  const SizedBox(height: 24),
                  // Package Details Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.paymentProcessScreen_selectedPackage,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.greyColor,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.packageName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                l10n.paymentProcessScreen_price,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.greyColor,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${widget.price.toStringAsFixed(2)} DZD',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Payment Method Selection
                  Text(
                    l10n.paymentProcessScreen_paymentMethod,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 12),
                  ...paymentMethods.map((method) => Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: RadioListTile<String>(
                          value: method['name'],
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                          title: Text(
                            method['name'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          subtitle: Text(
                            method['description'],
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.greyColor,
                                    ),
                          ),
                          secondary: Image.asset(
                            method['icon'],
                            width: 40,
                            height: 40,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.credit_card,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          activeColor: AppColors.primaryColor,
                        ),
                      )),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: RadioListTile<String>(
                      value: 'new_card',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                      title: Text(
                        l10n.paymentProcessScreen_addNewCard,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      subtitle: Text(
                        l10n.paymentProcessScreen_newCardDescription,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      secondary: Image.asset(
                        'assets/icons/visa_card.png',
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.credit_card,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      activeColor: AppColors.primaryColor,
                    ),
                  ),
                  // Card Fields (visible only for new card)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: _selectedPaymentMethod == 'new_card' ? null : 0,
                    child: _selectedPaymentMethod == 'new_card'
                        ? Column(
                            children: [
                              const SizedBox(height: 16),
                              MyTextField(
                                controller: _cardNumberController,
                                hintText: l10n.paymentProcessScreen_cardNumber,
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: AppColors.greyColor,
                                ),
                                keyBoardType: TextInputType.number,
                                focusNode: _cardNumberFocus,
                                onSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_expiryFocus);
                                },
                                errorText: _cardNumberError,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyTextField(
                                      controller: _expiryController,
                                      hintText:
                                          l10n.paymentProcessScreen_expiry,
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        color: AppColors.greyColor,
                                      ),
                                      keyBoardType: TextInputType.datetime,
                                      focusNode: _expiryFocus,
                                      onSubmitted: (_) {
                                        FocusScope.of(context)
                                            .requestFocus(_cvvFocus);
                                      },
                                      errorText: _expiryError,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: MyTextField(
                                      controller: _cvvController,
                                      hintText: l10n.paymentProcessScreen_cvv,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: AppColors.greyColor,
                                      ),
                                      keyBoardType: TextInputType.number,
                                      focusNode: _cvvFocus,
                                      errorText: _cvvError,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  // Confirm Payment Button
                  Center(
                    child: Container(
                      width: size.width - 32,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: _isFormValid && !_isLoading
                            ? () => _confirmPayment(context, l10n)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: AppColors.primaryColor.withOpacity(0.4),
                        ),
                        child: _isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: AppColors.whiteColor,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    l10n.paymentProcessScreen_loading,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                l10n.paymentProcessScreen_confirmPayment,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
