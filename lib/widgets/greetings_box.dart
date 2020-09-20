import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yollo/config/config.dart';

class GreetingsBox extends StatelessWidget {
  final String greeting;
  final String name;

  const GreetingsBox({Key key, this.greeting, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              '$greeting,',
              style: TextStyle(
                color: Palette.kPurple,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 4.0,),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Palette.kPurple,
              size: 20.0,
            ),
            onPressed: () => print('Search'),
          ),
        )
      ],
    );
  }
}
