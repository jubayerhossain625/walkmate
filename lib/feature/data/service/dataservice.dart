
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walk_mate/feature/model/targetModel.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';

class DataService {
  late TargetModel targetModel;
  final db = FirebaseFirestore.instance;

  Future createTask(TargetModel dataModel) async {

 return  await db.collection("task").doc(dataModel.id.toString()).set(
  dataModel.toJson());
  }

  Future addCheekPoint(CheekPoint cheekPoint,String id) async {
    return  await db.collection("task").doc(id).collection("cheekpoint").doc().set(
        cheekPoint.toJson());
  }

  Future createHistory(TargetModel dataModel) async {

    return  await db.collection("history").doc(dataModel.id.toString()).set(
        dataModel.toJson()
    );
  }



  // Future<List<TargetModel>> getTaskTarget()async{
  //   List<TargetModel> allData = [];
  // var task = await  FirebaseFirestore.instance.collection("task").get();
  // allData.add(TargetModel.fromJson(task.docs.first.data()));
  // return allData;
  // }





}