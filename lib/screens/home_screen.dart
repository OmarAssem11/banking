import 'package:banking/components/components.dart';
import 'package:banking/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<GlobalProvider>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditCardWidget(
            cardNumber: '4027 8471 9941 2301',
            expiryDate: '10/12/2025',
            cardType: CardType.visa,
            cardHolderName: 'Omar Assem',
            cvvCode: '263',
            showBackView: false,
            obscureCardCvv: false,
            obscureCardNumber: false,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (value) {},
            cardBgColor: const Color.fromARGB(255, 168, 118, 0),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(40)),
                color:
                    provider.isDark ? theme.colorScheme.surface : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      top: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'Transactions',
                      style: theme.textTheme.headline3,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          transactionWidget(context),
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
