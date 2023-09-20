
import 'package:flutter/material.dart';

class AnotherGrid extends StatelessWidget {
  const AnotherGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                child: Image.asset('assets/images/numpjok.jpg'
                ),
              ),
            ),
            Text(
              "Foods",
              style: TextStyle(fontWeight: FontWeight.bold, height: 1),
            )
          ],
      ),
    );
  }
}
