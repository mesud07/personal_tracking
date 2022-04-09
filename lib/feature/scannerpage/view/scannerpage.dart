import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personaltracking/core/appColor/color_theme.dart';
import 'package:personaltracking/feature/profilepage/model/usermodel.dart';
import 'package:personaltracking/feature/profilepage/view/profilepageview.dart';
import 'package:personaltracking/feature/scannerpage/service/scannerService.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({ Key? key }) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final qrkey = GlobalKey(debugLabel: "QR");
  Barcode? barcode;
  String? code;
  ScannerService _scannerService=ScannerService();
 int? inoutNumber;
 int girisSayisi=0;
   QRViewController? qrViewController;
   @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void reassemble()async {
    super.reassemble();
    if(Platform.isAndroid){
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().nightblue,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ProfilePage()), (route) => false),)),
      body: Stack(
        alignment: Alignment.center,
        children:[
      buildQrView(),
      Positioned(
        bottom: 10,
        child: Container(
          color: Colors.white24,
          padding: const EdgeInsets.all(8.0),
          child: Text(barcode?.code??"scan code",
          style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),),
        )),
       
           
      ]),
      
    );
  }
  Widget buildQrView(){
    return QRView(key: qrkey,
     onQRViewCreated: onQRViewCreated,
     overlay: QrScannerOverlayShape(
       borderColor: AppColors().red,
       borderRadius: 10,
       borderLength: 20,
       borderWidth: 10
     ),
     );
  }

  void onQRViewCreated(QRViewController controller)async{
    
      this.qrViewController=controller;
    

    qrViewController!.scannedDataStream.listen((event) {
      setState(()async {
     //normal şartlarda bu şekilde kod atanması gerekli
     this.barcode=event;
    
      if(this.barcode?.code=="data"&&girisSayisi!=1){
        girisSayisi=1;
        
         var date=DateTime.now();
     UserModel user=await _scannerService.getUser();
     inoutNumber=user.inoutNumber;
     if(inoutNumber!=null){
      _scannerService.comeInOut(context,barcode?.code, date,inoutNumber!);
     }
    
      }
    });
    }
    );
    
    
     
  

   
  }
}