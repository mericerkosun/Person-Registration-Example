import 'package:person_registration/entity/person.dart';
import 'package:person_registration/sqlite/database_assistant.dart';

class PersonDAORepository {
  Future<void> personRegister(String person_name, String person_phone) async {
    var db = await DatabaseAssistant.databaseAccess();
    var infos = Map<String,dynamic>();
    infos["person_name"] = person_name;
    infos["person_phone"] = person_phone;
    await db.insert("person", infos);
  }

  Future<void> personUpdate(int person_id, String person_name, String person_phone) async {
    var db = await DatabaseAssistant.databaseAccess();
    var infos = Map<String,dynamic>();
    infos["person_name"] = person_name;
    infos["person_phone"] = person_phone;
    await db.update("person", infos, where: "person_id=?", whereArgs: [person_id]);
  }

  Future<List<Person>> getAllPeople() async {
    var db = await DatabaseAssistant.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM person");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Person(row["person_id"], row["person_name"], row["person_phone"]);
    });
  }

  Future<List<Person>> searchPerson(String searchWord) async {
    var db = await DatabaseAssistant.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM person WHERE person_name like '%$searchWord%'");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Person(row["person_id"], row["person_name"], row["person_phone"]);
    });
  }

  Future<void> personDelete(int person_id,) async {
    var db = await DatabaseAssistant.databaseAccess();
    await db.delete("person", where: "person_id=?",whereArgs: [person_id]);
  }
}