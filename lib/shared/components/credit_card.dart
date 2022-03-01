import 'package:banking/providers/card_provider.dart';
import 'package:banking/shared/components/custom_button.dart';
import 'package:banking/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatelessWidget {
  final grey = Colors.grey;
  final _formKey = GlobalKey<FormState>();
  final cardHolderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvCodeController = TextEditingController();
  final pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardProvider>(context).cardModel;
    final cardNumber = card?.cardNumber
        .replaceAllMapped(RegExp('.{4}'), (match) => '${match.group(0)} ');
    return card == null
        ? InkWell(
            onTap: () => _addCard(context),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  width: 4,
                  color: grey,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    size: 64,
                    color: grey,
                  ),
                  Text(
                    'Add Card',
                    style: TextStyle(
                      fontSize: 25,
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        : CreditCardWidget(
            cardHolderName: card.cardHolderName,
            cardNumber: cardNumber!,
            expiryDate: card.expiryDate,
            cvvCode: card.cvvCode,
            showBackView: false,
            obscureCardCvv: false,
            obscureCardNumber: false,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (_) {},
            cardBgColor: const Color.fromARGB(255, 168, 118, 0),
          );
  }

  void _addCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 32,
            left: 32,
            top: 15,
            bottom: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Card information',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              CustomTextFormField(
                controller: cardHolderNameController,
                text: 'Card holder name',
                prefix: Icons.account_circle_rounded,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 6),
              CustomTextFormField(
                controller: cardNumberController,
                text: 'Card number',
                prefix: Icons.credit_card,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: expiryDateController,
                      text: 'Expiry date',
                      prefix: Icons.date_range,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextFormField(
                      controller: cvvCodeController,
                      text: 'CVV code',
                      prefix: Icons.confirmation_number,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Security',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              CustomTextFormField(
                controller: pinCodeController,
                text: 'Pin code',
                prefix: Icons.pin_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<CardProvider>(
                      context,
                      listen: false,
                    ).createCard(
                      cardHolderName: cardHolderNameController.text,
                      cardNumber: cardNumberController.text,
                      cvvCode: cvvCodeController.text,
                      expiryDate: expiryDateController.text,
                      pinCode: pinCodeController.text,
                    );
                    Navigator.of(context).pop();
                    final snackBar = SnackBar(
                      backgroundColor: const Color.fromARGB(255, 2, 117, 5),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Card has been added successfully!'),
                          Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 26,
                          )
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
