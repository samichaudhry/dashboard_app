import 'package:flutter/material.dart';

class UpgradeProAccount extends StatelessWidget {
  const UpgradeProAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFfedd69),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "Upgrade your account to ",
                        ),
                        TextSpan(
                          text: "PRO+",
                          style: TextStyle(
                            color: Color(0xffff698a),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).size.width >= 1100,
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: "With a "),
                            TextSpan(
                              text: "PRO+ ",
                              style: TextStyle(
                                color: Color(0xffff698a),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "account you get many additional and convenient features to control your finances.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image(image: AssetImage("assets/astranaut.png")),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
