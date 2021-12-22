import 'package:flutter/material.dart';
import 'package:flutter_router_example/router/route_utils.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_PAGE.error.toTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error ?? ""),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(APP_PAGE.home.toName);
              },
              child: const Text(
                "Back to Home"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
