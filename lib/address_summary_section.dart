import 'package:dashboard_app/custom_textfield.dart';
import 'package:dashboard_app/service_summary_section.dart';
import 'package:flutter/material.dart';

class AddressSummarySection extends StatefulWidget {
  const AddressSummarySection({Key? key}) : super(key: key);

  @override
  State<AddressSummarySection> createState() => _AddressSummarySectionState();
}

class _AddressSummarySectionState extends State<AddressSummarySection> {
  double balance = 2500;
  int transactions = 5;
  final List<String> _registeredAddresses = [
    'Address1',
    'Address2',
    'Address3',
  ];
  String? _selectedAddress;

  final TextStyle _textStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 15);
  final BoxDecoration _boxDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 181, 144, 187),
      borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            decoration: _boxDecoration,
            child: addressSummary(context),
          ),
        ),
        // Service Summary Section
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: _boxDecoration,
              child: ServiceSummarySection(selectedAddress: _selectedAddress),
            ),
          ),
        )
      ],
    );
  }

// Address Summary Section
  Padding addressSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          Container(
            decoration: boxDecoration,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  hint: Text(
                    "Select Your Account Address",
                    style: _textStyle,
                  ),
                  value: _selectedAddress,
                  isExpanded: true,
                  items: _registeredAddresses.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: _textStyle,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedAddress = newValue as String;
                    });
                  },
                ),
              ),
            ),
          ),
          (_selectedAddress == null)
              ? const Spacer()
              : Expanded(
                  child: ListView(
                    children: [
                      customTextField(context, "Balance", "$balance\$"),
                      customTextField(
                          context, "Number Of Transaction", transactions),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
