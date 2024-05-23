import 'package:dio/dio.dart';
import 'package:person_registration/entity/kisiler_cevap.dart';
import 'package:person_registration/entity/person.dart';
import 'dart:convert';

class PersonDAORepository {

  List<Kisiler> parseKisilerCevap(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }
  Future<void> personRegister(String person_name, String person_phone) async {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad" : person_name, "kisi_tel" : person_phone};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi ekle : ${cevap.data.toString()}");
  }

  Future<void> personUpdate(int person_id, String person_name, String person_phone) async {
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id" : person_id,"kisi_ad" : person_name, "kisi_tel" : person_phone};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi güncelle : ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> getAllPeople() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<List<Kisiler>> searchPerson(String searchWord) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad" : searchWord};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<void> personDelete(int person_id,) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id" : person_id};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("Kişi sil : ${cevap.data.toString()}");
  }
}