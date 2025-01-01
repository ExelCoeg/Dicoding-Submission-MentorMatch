import 'package:flutter/material.dart';
import 'mentor_data.dart';
import 'main.dart';

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text("All mentors",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.tune),
                  const SizedBox(width: 10),
                  Icon(Icons.swap_vert)
                ],
              ),
            )
          ],
        )),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchBar(
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    shadowColor: WidgetStateColor.transparent,
                    hintText: "Search",
                    leading: const Icon(Icons.search)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyMentors.length,
                  itemBuilder: (context, index) {
                    final MentorData mentor = dummyMentors[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10,vertical:5),
                      child: Card(

                        child: Row(
                          children: [
                            Expanded(
                                child: ClipRRect(
                                  borderRadius:BorderRadius.all(Radius.circular(10)),
                                  child: SizedBox(
                                      height: 115,
                                      child: Image.asset(mentor.imageAsset,
                                          fit: BoxFit.cover)),
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(mentor.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          CircleAvatar(
                                              radius: 6,
                                              backgroundColor: primaryColor,
                                              child: Icon(
                                                size: 10,
                                                Icons
                                                    .local_fire_department_outlined,
                                                color: onBackgroundColor,
                                              ))
                                        ],
                                      ),
                                      Text("${mentor.job} at ${mentor.company}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  120, 120, 120, 1.0))),
                                      Row(
                                        children: [
                                          Text(mentor.mentoringPrice,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(width: 6),
                                          Text("per month",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      120, 120, 120, 1.0)))
                                        ],
                                      ),
                                      Row(
                                        children: mentor.skills.take(2)
                                            .map(
                                              (skill) => Card(
                                                shadowColor: Colors.grey,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),

                                                  child: Text(
                                                    skill,
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          120, 120, 120, 1.0),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
