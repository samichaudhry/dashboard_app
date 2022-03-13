import 'package:dashboard_app/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ServiceSummarySection extends StatefulWidget {
  final String? selectedAddress;
  const ServiceSummarySection({Key? key, @required this.selectedAddress})
      : super(key: key);

  @override
  State<ServiceSummarySection> createState() => _ServiceSummarySectionState();
}

class _ServiceSummarySectionState extends State<ServiceSummarySection> {
  bool license = true;
  int licenseNumber = 12345789;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          (widget.selectedAddress == null)
              ? Container()
              : Expanded(
                  child: ListView(
                    children: [
                      customTextField(context, "License", "$license"),
                      customTextField(
                          context, "License Number", "$licenseNumber"),
                      customTextField(
                          context,
                          "Valid To",
                          intl.DateFormat.yMd()
                              .add_jm()
                              .format(DateTime.now())),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
