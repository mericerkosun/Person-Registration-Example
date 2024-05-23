import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/cubit/homepage_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().showAllPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searching ?
        TextField(decoration: InputDecoration(hintText: "Search..."),
        onChanged: (searchResult){
          context.read<HomepageCubit>().search(searchResult);
        },) :
            Text("Homepage"),
        actions: [
          searching ?
          IconButton(onPressed: (){
            setState(() {
              searching = false;
            });
            context.read<HomepageCubit>().showAllPeople();
          }, icon: Icon(Icons.cancel)) :
          IconButton(onPressed: (){
            setState(() {
              searching = true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomepageCubit,List<Person>>(
        builder: (context, personList){
          if (personList.isNotEmpty){
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (context,index){
                var person = personList[index];
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
                                    context.read<HomepageCubit>().delete(person.person_id);
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
