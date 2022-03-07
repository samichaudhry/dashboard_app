import 'package:dashboard_app/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class LatestTransactionPanel extends StatefulWidget {
  const LatestTransactionPanel({Key? key}) : super(key: key);

  @override
  State<LatestTransactionPanel> createState() => _LatestTransactionPanelState();
}

class _LatestTransactionPanelState extends State<LatestTransactionPanel> {
  final ScrollController _scrollController = ScrollController();
  var transactionName = "ABC";
  var transactionType = "incoming";
  var profileImage =
      "https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659652_960_720.png";
  var transactionId = "1234";
  var transactionAmount = "1234";
  @override
  Widget build(BuildContext context) {
    return customBox(
      "Latest Transactions",
      TextButton(
        child: const Text(
          "See all",
          style: TextStyle(
            color: Color(0xffff698a),
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {},
      ),
      [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(children: [
                  Expanded(
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFfedd69),
                              foregroundImage: NetworkImage(profileImage),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                transactionType == "incoming"
                                    ? Icons.download
                                    : transactionType == "outgoing"
                                        ? Icons.upload
                                        : Icons.help,
                                size: 12,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            transactionName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      intl.DateFormat.MMMd().add_jm().format(DateTime.now()),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Visibility(
                    visible: MediaQuery.of(context).size.width >= 1100,
                    child: Expanded(
                      child: Text(
                        "ID: $transactionId",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text:
                              "${transactionType == "incoming" ? "+" : transactionType == "outgoing" ? "-" : ""}${"\$"}",
                          style: const TextStyle(
                            fontSize: 16 * 0.7,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: transactionAmount,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
