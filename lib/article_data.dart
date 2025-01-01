import 'package:mentormatchclone/mentor_data.dart';

class ArticleData{
  MentorData author;
  String title;
  String articleAge;
  String paragraph;
  String imageAsset;

  ArticleData({
   required this.author,
   required this.title,
   required this.articleAge,
   required this.paragraph,
   required this.imageAsset
});}

  final List<ArticleData> articles = [
    ArticleData(
      author:dummyMentors[0],
      title: '4 Steps for Writing a UI/UX Design Resume',
      articleAge: '3 weeks ago',
      paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac elit massa. Proin sit amet odio justo. Donec tempor arcu eu ipsum condimentum, id varius odio accumsan. Etiam scelerisque risus vitae tellus vehicula sagittis. Nulla maximus libero in erat tincidunt, id fringilla lorem aliquam. Donec mollis nunc in interdum pretium.',
      imageAsset: 'images/articleOne.jpeg',
    ),ArticleData(
      author:dummyMentors[1],
      title: 'An amazing way to make a career in the UI/UX industry',
      articleAge: '2 weeks ago',
      paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac elit massa. Proin sit amet odio justo. Donec tempor arcu eu ipsum condimentum, id varius odio accumsan. Etiam scelerisque risus vitae tellus vehicula sagittis. Nulla maximus libero in erat tincidunt, id fringilla lorem aliquam. Donec mollis nunc in interdum pretium.',
      imageAsset: 'images/articleTwo.jpeg',
    ),
  ];
