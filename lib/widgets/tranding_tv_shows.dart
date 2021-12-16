import 'package:flutter/material.dart';
import 'package:movie/utils/text.dart';

class ToptvShows extends StatelessWidget {
  final List Toptv;

  const ToptvShows({Key? key, required this.Toptv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeadModifierText(
            text: 'Top Rated Series',
            color: Colors.white,
            size: 25.0,
          ),
          SizedBox(height: 15.0),
          Container(
            height: 270.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Toptv.length,
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
                                            Toptv[index]['poster_path']))),
                          ),
                          SizedBox(height: 15.0),
                          //Container to display text beneath the image
                          Container(
                            child: ModifiedText(
                              text: Toptv[index]['original_name'] != null
                                  ? Toptv[index]['original_name']
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
