import 'package:flutter/material.dart';

mixin CustomSnackbarMixin {
  // Shows a simple snackbar with the provided message
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Hides the current snackbar and shows a new one with the provided message
  void showSnackBar2(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }
}


/*Bu Mixin'i başka bir sınıfta kullanırken şöyle kullanılır: 

class HomePage extends StatelessWidget with CustomSnackbarMixin {
  showSnackBar(context, 'This is a simple snackbar!');
  showSnackBar2(context, 'This is a new snackbar, replacing the previous one!');
}
 */
