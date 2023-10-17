import 'package:flutter/material.dart';

class CustomExpansionPanel extends StatelessWidget {
  final void Function(int, bool) expansionCallback;
  final String title;
  final List<Widget> content;
  final bool isExpanded;
  const CustomExpansionPanel({
    required this.expansionCallback,
    required this.isExpanded,
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ExpansionPanelList(
        expansionCallback: expansionCallback,
        children: [
          ExpansionPanel(
            isExpanded: isExpanded,
            headerBuilder: (context, isExpanded) => Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.only(left: 8, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content,
              ),
            ),
          )
        ],
      ),
    );
  }
}
