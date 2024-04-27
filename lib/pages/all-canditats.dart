import 'package:candidature/models/person.dart';
import 'package:candidature/pages/candidats_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  String name = "";
  bool liked = false;
  List<Person> persons = [];
  List<Person> friends = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Hello Samit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          SizedBox(
              width: 25,
              height: 20,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.notification_add,
                  size: 25,
                ),
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [


Padding(
            padding:EdgeInsets.only(left:20,top:40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Candidates",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(right: 20.0),
                  child: Text(
                    "${persons.length} candidates",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  ),
                ),
              ],
                ),
          ),


            Expanded(
              child: ListView(
                children: persons
                    .map(
                      (person) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 80,
                              height: 80,
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(
                                'https://guardian.ng/wp-content/uploads/2022/06/Adebayo-2.jpg',
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes !=
                                              null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${person.name} ${person.surname}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${person.bibliography} ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.3)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            
          ],
          
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Person person = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FriendFormPage(),
              ));

          setState(() => persons.add(person));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Acceul'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'vote'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }
}
