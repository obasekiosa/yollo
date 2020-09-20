import 'package:flutter/material.dart';
import 'package:yollo/config/config.dart';
import 'package:yollo/data/data.dart';
import 'package:yollo/widgets/widgets.dart';
import 'package:yollo/models/models.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final List<Post> imagePosts = posts.where((element) => element.imageUrl != null).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Palette.kPinkGrey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Palette.kPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              brightness: Brightness.dark,
              backgroundColor: Palette.kPinkGrey,
              floating: true,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 8.0),
                child: Text(
                  'YOLLO',
                  style: TextStyle(
                    color: Palette.kPurple,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins'
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              sliver: SliverToBoxAdapter(child: GreetingsBox(greeting: 'Hello', name: 'Alan')),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 30.0),
              sliver: SliverToBoxAdapter(
                child: UsersView(users: onlineUsers),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Post post = imagePosts[index];
                        return PostContainer(post: post);
                    },
                  childCount: imagePosts.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
