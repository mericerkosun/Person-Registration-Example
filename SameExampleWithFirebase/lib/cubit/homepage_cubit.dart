import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_registration/entity/person.dart';
import 'package:person_registration/repo/person_dao_repository.dart';

// Firebase yapısı gereği verileri getirme ve arama fonksiyonları cubit içerisinde olmalı.

class HomepageCubit extends Cubit<List<Kisiler>> {
  HomepageCubit() : super(<Kisiler>[]);

  var pRepo = PersonDAORepository();
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> showAllPeople() async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler != null){
        var liste = <Kisiler>[];
        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          liste.add(kisi);
        });
        emit(liste);
      }
    });
  }

  Future<void> search(String searchWord) async {
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler != null){
        var liste = <Kisiler>[];
        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          if(kisi.kisi_ad.contains(searchWord)){
            liste.add(kisi);
          }
        });
        emit(liste);
      }
    });
  }

  Future<void> delete(String person_id,) async {
    await pRepo.personDelete(person_id);
    await showAllPeople();
  }
}