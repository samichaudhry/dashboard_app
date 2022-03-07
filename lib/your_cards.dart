import 'package:dashboard_app/custom_box.dart';
import 'package:flutter/material.dart';

extension StringExtensions on String {
  String get securedString {
    if (length > 4) {
      return "**** ${substring(length - 4)}";
    } else {
      return this;
    }
  }
}

class YourCardPanel extends StatelessWidget {
  YourCardPanel({Key? key}) : super(key: key);

  final cardType = "visa";
  final cardNumber = "123456789";
  final ScrollController _scrollController = ScrollController();

  Widget customCardTiles(_cardType, _cardNumber) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFf2f6fe),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(3),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: _cardType == "visa"
                  ? const AssetImage("assets/visa.png")
                  : _cardType == "mastercard"
                      ? const AssetImage("assets/mastercard.png")
                      : _cardType == "discover"
                          ? const AssetImage("assets/discover.png")
                          : const AssetImage("assets/amex.png"),
              height: 40,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              _cardNumber,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Expanded(
              flex: 1,
              child: SizedBox(
                width: 10,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customBox("Your Card", Container(), [
      Expanded(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: 3,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: customCardTiles(cardType, cardNumber.securedString),
              );
            })),
      )
    ]);
  }
}
