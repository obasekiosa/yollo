import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yollo/config/config.dart';
import 'package:yollo/models/models.dart';
import 'package:yollo/widgets/custom_profile_clipper.dart';
import 'package:yollo/widgets/custom_splash_clipper.dart';

const _kProfileBubbleHeight = 150.0;
const _kPostContainerHeight = 400.0;

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            height: _kPostContainerHeight,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50.0,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: post.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: _kPostContainerHeight - _kProfileBubbleHeight,
              ),
              ClipPath(
                clipper: CustomProfileClipper(radius: 50.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 24.0),
                  height: _kProfileBubbleHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                post.user.imageUrl,
                              ),
                            ),
                            SizedBox(width: 24.0,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.user.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  post.timeAgo,
                                  style: TextStyle(
                                    color: Palette.kLightGrey,
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
