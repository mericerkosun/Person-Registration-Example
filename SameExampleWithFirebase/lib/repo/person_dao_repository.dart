import 'package:firebase_database/firebase_database.dart';
import 'package:person_registration/entity/person.dart';

class PersonDAORepository {
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> personRegister(String person_name, String person_phone) async {
    var bilgi = Map<String,dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = person_name;
    bilgi["kisi_tel"] = person_phone;
    refKisiler.push().set(bilgi);
  }

  Future<void> personUpdate(String person_id, String person_name, String person_phone) async {
    var bilgi = Map<String,dynamic>();
    bilgi["kisi_ad"] = person_name;
    bilgi["kisi_tel"] = person_phone;
    refKisiler.child(person_id).update(bilgi);
  }

  Future<void> personDelete(String person_id,) async {
    refKisiler.child(person_id).remove();
  }
}