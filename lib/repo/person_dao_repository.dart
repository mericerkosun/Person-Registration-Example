import 'package:person_registration/entity/person.dart';

class PersonDAORepository {
  Future<void> personRegister(String person_name, String person_phone) async {
    print("Register : $person_name - $person_phone");
  }

  Future<void> personUpdate(int person_id, String person_name, String person_phone) async {
    print("Register : $person_id - $person_name - $person_phone");
  }

  Future<List<Person>> getAllPeople() async {
    var peopleList = <Person>[];
    var p1 = Person(1, "Onuachu", "3030");
    var p2 = Person(2, "Visca", "0707");
    var p3 = Person(1, "Meunier", "1212");
    peopleList.add(p1);
    peopleList.add(p2);
    peopleList.add(p3);
    return peopleList;
  }

  Future<List<Person>> searchPerson(String searchWord) async {
    var peopleList = <Person>[];
    var p1 = Person(1, "Onuachu", "3030");
    peopleList.add(p1);
    return peopleList;
  }

  Future<void> personDelete(int person_id,) async {
    print("Register : $person_id");
  }
}