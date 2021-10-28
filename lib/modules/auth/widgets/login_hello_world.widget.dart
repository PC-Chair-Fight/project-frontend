import 'package:flutter/material.dart';

class LoginHelloWorld extends StatelessWidget {
  const LoginHelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.extension,
                  size: 100,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'World',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Button 1'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button 2'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
