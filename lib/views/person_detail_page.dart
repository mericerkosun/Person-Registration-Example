import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/cubit/person_detail_cubit.dart';
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
                  context.read<PersonDetailCubit>().update(widget.person.person_id, tfPersonName.text, tfPersonPhone.text);
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
