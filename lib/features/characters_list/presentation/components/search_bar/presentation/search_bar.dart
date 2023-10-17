import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onFieldSubmitted;
  const CustomSearchBar({
    required this.onFieldSubmitted,
    required this.controller,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xff484444),
        borderRadius: BorderRadius.circular(100),
      ),
      width: double.infinity,
      child: TextFormField(
        cursorColor: Colors.pink.shade900,
        textCapitalization: TextCapitalization.words,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: I18n.of(context).translate('search'),
        ),
      ),
    );
  }
}
