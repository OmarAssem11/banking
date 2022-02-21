import 'package:banking/components/transaction_widget.dart';
import 'package:banking/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color:
              themeProvider.isDark ? theme.colorScheme.surface : Colors.white,
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
                itemBuilder: (_, index) => const TransactionWidget(
                  name: 'Mohamed Salem',
                  amount: 860,
                  imageUrl:
                      'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1645017448~exp=1645018048~hmac=193ded0c9ac37adbdf730275dc5c688b843b169302e3be45b00e2885e0400a3b&w=1060',
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
