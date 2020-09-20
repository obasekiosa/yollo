import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yollo/config/config.dart';
import 'package:yollo/models/models.dart';

class UsersView extends StatelessWidget {
  final List<User> users;

  const UsersView({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 10.0,
      ),
      height: 80.0,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: _CustomAvatar(
                isAddButton: true,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _CustomAvatar(
              user: users[index - 1],
            ),
          );
        },
      ),
    );
  }
}

class _CustomAvatar extends StatelessWidget {
  final User user;
  final bool isAddButton;

  const _CustomAvatar({Key key, this.user, this.isAddButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: Palette.kPurple.withOpacity(0.7),
      child: isAddButton
          ? Align(
              alignment: Alignment.center,
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.deepPurple,
                size: 18.0,
              ),
            )
          : CircleAvatar(
              radius: 26.0,
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(
                user.imageUrl,
              ),
            ),
    );
  }
}
