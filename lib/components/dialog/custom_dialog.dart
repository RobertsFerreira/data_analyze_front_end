import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String erroMessage;
  final void Function() functionBtnNo;
  final Function()? functionBtnYes;
  final String messageTitle;
  final String messageBtnNo;
  final String messageBtnYes;

  const CustomDialog({
    Key? key,
    required this.erroMessage,
    required this.functionBtnNo,
    this.functionBtnYes,
    required this.messageTitle,
    required this.messageBtnNo,
    this.messageBtnYes = 'Sim',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => functionBtnNo(),
          child: Text(messageBtnNo),
        ),
        functionBtnYes != null
            ? ElevatedButton(
                onPressed: () => functionBtnYes!(),
                child: Text(messageBtnYes),
              )
            : const SizedBox()
      ],
      title: Text(messageTitle),
      content: Text(erroMessage),
    );
  }
}
