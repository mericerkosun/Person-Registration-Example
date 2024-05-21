import 'package:flutter/material.dart';
import 'package:person_registration/entity/person.dart';

class PersonDetailPage extends StatefulWidget {

  Person person;

  PersonDetailPage(this.person);

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {

  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    var clickedPerson = widget.person;
    tfPersonName.text = clickedPerson.person_name;
    tfPersonPhone.text = clickedPerson.person_phone;
  }

  Future<void> update(int person_id, String person_name, String person_phone) async {
    print("Register : $person_id - $person_name - $person_phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Detail"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0,left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(
                    hintText: "Name"
                ),
              ),
              TextField(
                controller: tfPersonPhone,
                decoration: const InputDecoration(
                    hintText: "Phone Number"
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  update(widget.person.person_id, widget.person.person_name, widget.person.person_phone);
                },
                child: const Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
