import 'package:flutter/material.dart';
import 'package:mentormatchclone/main.dart';
import 'package:mentormatchclone/mentor_data.dart';
import 'package:mentormatchclone/article_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25)),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 110,
                ),
                child: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi there!",
                              style: TextStyle(color: onBackgroundColor)),
                          Text("Let's do something incredible today!",
                              style: TextStyle(
                                  color: Color.fromRGBO(189, 188, 251, 1.0),
                                  fontSize: 16))
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: onBackgroundColor,
                        child: Icon(Icons.notifications_outlined),
                      )
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text("MentorMatch Awards",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyMentors.length,
                        itemBuilder: (context, index) {
                          final MentorData mentor = dummyMentors[index];
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Card(
                                child: Column(
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                      child: Stack(
                                        alignment: Alignment(0.9, -0.9),
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            height: 130,
                                            child: Image.asset(
                                                mentor.imageAsset,
                                                fit: BoxFit.cover),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: StarRating(
                                                  rating: mentor.rating))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(mentor.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(width: 5),
                                        CircleAvatar(
                                            radius: 6,
                                            backgroundColor: primaryColor,
                                            child: Icon(
                                              size: 10,
                                              Icons
                                                  .local_fire_department_outlined,
                                              color: onBackgroundColor,
                                            )
                                        )
                                      ],
                                    ),
                                    Text(
                                      "${mentor.job} at ${mentor.company}",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text("New Articles",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return ArticleList();
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleCard(article: articles[0]),
        ArticleCard(article: articles[1]),
      ],
    );
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleData article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset(article.author.imageAsset,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.author.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${article.author.job} at ${article.author.company}",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              article.articleAge,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                    height: 95,
                    child: Text(article.paragraph,
                        maxLines: 10, overflow: TextOverflow.fade))
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
              child: SizedBox(
                width: 500,
                height: 200,
                child: Image.asset(article.imageAsset, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5.0),
      child: Row(
        children: [
          Icon(Icons.star, color: primaryColor, size: 16),
          Text(
            "$rating",
            style: TextStyle(fontWeight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}
