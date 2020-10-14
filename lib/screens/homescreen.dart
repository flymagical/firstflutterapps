import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    clsGridMenuTemplate("Foods", "images/scooter.png",
                        Colors.blue),
                    clsGridMenuTemplate("Drinks", "images/scooter.png",
                        Colors.yellow[200]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    clsGridMenuTemplate("Foods", "images/scooter.png",
                        Colors.yellow[200]),
                    clsGridMenuTemplate("Drinks", "images/scooter.png",
                        Colors.blue),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget clsGridMenuTemplate(String title, String image, Color color) {
    return Flexible(
      child: GestureDetector(
        child: Container(
          color: color,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
