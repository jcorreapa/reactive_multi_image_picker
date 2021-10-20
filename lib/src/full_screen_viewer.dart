import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FullScreenViewer extends StatelessWidget {
  final Widget child;
  const FullScreenViewer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showFullScreenChild(context),
      child: Hero(tag: child, child: child),
    );
  }

  void showFullScreenChild(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              elevation: 0,
            ),
            body: Center(
              child: Hero(
                tag: child,
                child: InteractiveViewer(child: child),
              ),
            ),
          );
        }));
  }
}
