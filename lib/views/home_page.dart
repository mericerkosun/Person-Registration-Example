import 'package:flutter/material.dart';
import 'package:person_registration/entity/person.dart';
import 'package:person_registration/views/new_register_page.dart';
import 'package:person_registration/views/person_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool searching = false;

  Future<List<Person>> showAllPeople() async {
    var peopleList = <Person>[];
    var p1 = Person(1, "Onuachu", "3030");
    var p2 = Person(2, "Visca", "0707");
    var p3 = Person(1, "Meunier", "1212");
    peopleList.add(p1);
    peopleList.add(p2);
    peopleList.add(p3);
    return peopleList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searching ?
        TextField(decoration: InputDecoration(hintText: "Search..."),
        onChanged: (searchResult){
          print("Search Result : $searchResult");
        },) :
            Text("Homepage"),
        actions: [
          searching ?
          IconButton(onPressed: (){
            setState(() {
              searching = false;
            });
          }, icon: Icon(Icons.cancel)) :
          IconButton(onPressed: (){
            setState(() {
              searching = true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Person>>(
        future: showAllPeople(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            var peopleList = snapshot.data;
            return ListView.builder(
              itemCount: peopleList!.length,
              itemBuilder: (context,index){
                var person = peopleList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetailPage(person))).then((value){
                      print("Returned to home page.");
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${person.person_name} - ${person.person_phone}"),
                          Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Should ${person.person_name} be deleted?"),
                                action: SnackBarAction(
                                  label: "Yes",
                                  onPressed: (){
                                    print("Deleted Person ID : ${person.person_id}");
                                  },
                                )
                              )
                            );
                          }, icon: Icon(Icons.delete_outline, color: Colors.black54,)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewRegisterPage())).then((value){
              print("Returned to home page.");
            });
          },
          child: Icon(Icons.add),
      )
    );
  }
}
