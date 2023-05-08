
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:walk_mate/feature/model/targetModel.dart';
import 'package:walk_mate/feature/model/targetpoint_datamodel.dart';
import 'package:walk_mate/feature/model/totalcheekpoint.dart';

import '../service/dataservice.dart';



class TargetProvider extends ChangeNotifier{
  final DataService service = DataService();
  // slider target controlling
  TargetsDataModel emptyTarget = TargetsDataModel(id: "",targetPoint: "",time: "",date:"" ,cheekPoint: []);
  TargetsDataModel get targetData => emptyTarget;

  List<TargetModel> empty = [];
  List<TargetModel> get history => empty;


  // add to myTargets.
  void myTarget(TargetsDataModel myTarget ){
      emptyTarget.id = myTarget.id;
      emptyTarget.targetPoint = myTarget.targetPoint;
      notifyListeners();
    }

  //add to new myCheek Point
    void myCheekPoint(CheekPoint cheekPoint){
      emptyTarget.cheekPoint!.add(cheekPoint);
      notifyListeners();
      service.addCheekPoint(cheekPoint,emptyTarget.id.toString());
    }


    TotalCheekPoint t = TotalCheekPoint(point: 0);

    TotalCheekPoint  get totalCheekPoint => t;
    void countingCheekPoint(){

      var total = 0;
      t.point=total;
    notifyListeners();
    }


  CheekPoint demoCheekPoint = CheekPoint(id: "0",point: "0");

  CheekPoint get cheekpointData => demoCheekPoint;

    void cheekPoint(CheekPoint cpoint){
      cheekpointData.id = cpoint.id;
      cheekpointData.point = cpoint.point;
      notifyListeners();
      print("--------cheek-Provider--------------");
      print(cheekpointData.id);
      print(cheekpointData.point);


    }


    Future getAllCheekPoint()async{
      emptyTarget.cheekPoint!.clear();
      targetData.cheekPoint!.clear();
      var task = await  FirebaseFirestore.instance.collection("task").doc(targetData.id.toString()).collection("cheekpoint").get();
      task.docs.forEach((element) {
        emptyTarget.cheekPoint!.add(
            CheekPoint.fromJson(element.data())
        );
      });
      countingCheekPoint();
      notifyListeners();
    }



  Future insertHistory()async{
    service.createHistory(TargetModel(id: emptyTarget.id,targetPoint: emptyTarget.targetPoint,date: emptyTarget.date,time: emptyTarget.time));
    await FirebaseFirestore.instance.collection("task").doc(emptyTarget.id.toString()).delete();
    emptyTarget.cheekPoint!.clear();

    notifyListeners();
  }

  Future historyData()async{
      empty.clear();
    var task = await  FirebaseFirestore.instance.collection("history").get();
    task.docs.forEach((element) {
      empty.add(TargetModel.fromJson(element.data()));
    });
      history.forEach((element) {
     print("------history-------");
     print(element.id);
   });
    notifyListeners();
  }



}