import 'package:banking/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final grey = Colors.grey;
  //final _formKey = GlobalKey<FormState>();
  final String cardNumber = '';
  final String expiryDate = '';
  final String cardHolderName = '';
  final String cvvCode = '';
  @override
  Widget build(BuildContext context) {
    final card = Provider.of<LoginProvider>(context).cardModel;
    return card == null
        ? InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (_) => Container(),
            ),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
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
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: false,
            obscureCardCvv: false,
            obscureCardNumber: false,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (_) {},
            cardBgColor: const Color.fromARGB(255, 168, 118, 0),
          );
  }
}
