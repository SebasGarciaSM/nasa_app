import 'package:flutter/material.dart';

class APODPage extends StatelessWidget {
  const APODPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.yellow,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://api.nasa.gov/assets/img/general/apod.jpg",
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  Text(
                    "Astronomy Picture of the Day".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
