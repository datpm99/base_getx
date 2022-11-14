import 'package:flutter/cupertino.dart';

class CusAlertDialog extends StatelessWidget {
  const CusAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Allow "Maps" to access your location while you use the app?'),
      content: const Text('Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Don\'t Allow'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          child: const Text('Allow'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
