import 'package:flutter/material.dart';
import 'package:movie/utils/text.dart';

class TrandingMovies extends StatelessWidget {
  final List trandingMovies;

  const TrandingMovies({Key? key, required this.trandingMovies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeadModifierText(
            text: 'Trending Movies',
            color: Colors.white,
            size: 25.0,
          ),
          SizedBox(height: 15.0),
          Container(
            height: 270.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trandingMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    //Container that displays the entire Scroll view
                    child: Container(
                      width: 140,
                      child: Column(
                        children: <Widget>[
                          //Container that displays the image
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trandingMovies[index]
                                                ['poster_path']))),
                          ),
                          SizedBox(height: 15.0),
                          //Container to display text beneath the image
                          Container(
                            child: ModifiedText(
                              text: trandingMovies[index]['original_title'] !=
                                      null
                                  ? trandingMovies[index]['original_title']
                                  : 'Loading',
                              color: Colors.white,
                              size: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
