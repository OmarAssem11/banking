// ignore_for_file: use_build_context_synchronously

import 'package:banking/providers/card_provider.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/components/custom_button.dart';
import 'package:banking/shared/components/custom_text_form_field.dart';
import 'package:banking/shared/firebase_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferMoneyScreen extends StatelessWidget {
  TransferMoneyScreen({Key? key}) : super(key: key);
  static const routeName = '/transfer';
  final _formKey = GlobalKey<FormState>();
  final accountNumberController = TextEditingController();
  final amountController = TextEditingController();
  final pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer money'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              CustomTextFormField(
                controller: accountNumberController,
                text: 'Account number',
                prefix: Icons.credit_card_rounded,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: amountController,
                text: 'Amount',
                prefix: Icons.attach_money_rounded,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: pinCodeController,
                text: 'Pin code',
                prefix: Icons.pin_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Transfer',
                onPressed: () async {
                  final card = Provider.of<CardProvider>(
                    context,
                    listen: false,
                  ).cardModel;
                  final pin = card!.pinCode;
                  final receiverUId = await provider
                      .getUIdByCardNumber(accountNumberController.text);
                  if (_formKey.currentState!.validate()) {
                    if (receiverUId != null &&
                        pinCodeController.text == pin &&
                        double.parse(amountController.text) <= card.balance) {
                      final snackBar = SnackBar(
                        backgroundColor: const Color.fromARGB(255, 2, 117, 5),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Transfer done successfully!'),
                            Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 26,
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      provider.createTransaction(
                        context: context,
                        amount: double.parse(amountController.text),
                        receiverUId: receiverUId,
                      );
                    } else if (receiverUId == null) {
                      ErrorHandler.invalidInput(
                        context: context,
                        errorMessage: 'Invalid account number',
                      );
                    } else if (double.parse(amountController.text) >
                        card.balance) {
                      ErrorHandler.invalidInput(
                        context: context,
                        errorMessage: 'Insufficient balance',
                      );
                    } else if (pinCodeController.text != pin) {
                      ErrorHandler.invalidInput(
                        context: context,
                        errorMessage: 'Wrong pin code',
                      );
                    }
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
