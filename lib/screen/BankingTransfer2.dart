

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../sqlDB/sqlDB.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'BankingMenu.dart';
import 'BankingTransferSuccessful.dart';

class BankingTras2 extends StatefulWidget {
  const BankingTras2({super.key});

  @override
  State<BankingTras2> createState() => _BankingTras2State();
}

class _BankingTras2State extends State<BankingTras2> {


  int _selectedBank = 0;

  List<DropdownMenuItem<int>> bankList = [];

  void loadBankList() {
    bankList = [];
    bankList.add(DropdownMenuItem(
      child: Text("Dhaka Bank"),
      value: 0,
    ));
    bankList.add(DropdownMenuItem(
      child: Text("AB Bank"),
      value: 1,
    ));
    bankList.add(DropdownMenuItem(
      child: Text("Brac Bank"),
      value: 2,
    ));
  }

  @override
  void initState() {
    super.initState();
    loadBankList();
  }


  TextEditingController _bankName = TextEditingController();
  TextEditingController _accountName = TextEditingController();
  TextEditingController _accountNo = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _otp = TextEditingController();
  // TextEditingController _dateTime = DateTime.now() as TextEditingController;


  SQLdb sql = SQLdb();

  bool isSwitch = false;
  bool isGetOtp = false;
  var tapCount = 0;

  void tappedConfirm() {


    if (tapCount != 1) {
      onPressed:() async{
        int rep = await sql.insertData("INSERT INTO 'transfer' (bankName, accountName, accountNo, branch, amount, message, otp) VALUES (\"${_bankName.text}\",\"${_accountName.text}\",\"${_accountNo.text}\",\"${_branch.text}\",${int.parse(_amount.text)},\"${_message.text}\",${int.parse(_otp.text)},\"${_branch.text}\")");
        // if(rep>0){
        //   Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(builder: (context)=>Home()),
        //           (route) => false);
        // }
      };
      BankingTransferSuccessful().launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              Text(
                isSwitch == true
                    ? Banking_lbl_Confirm_Transfer
                    : Banking_lbl_Transfer,
                style: primaryTextStyle(
                    color: Banking_TextColorPrimary,
                    size: 26,
                    fontFamily: fontBold),
              ),
              10.height,
              Text("Transfer Balance",
                  style: primaryTextStyle(
                      color: Banking_TextColorSecondary,
                      size: 14,
                      fontFamily: fontBold)),
              16.height,

              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 20.height,

                  // 20.height,
                  //
                  // 20.height,

                  SizedBox(height: 10,),
                  DropdownButtonFormField(

                    hint: Text("Select Bank"),
                    items: bankList,
                    value: _selectedBank,
                    onChanged: (value) {
                      setState(() {
                        _selectedBank = int.parse(value.toString());
                        // switch (_selectedBank) {
                        //   case 0:
                        //     _bankName = "Dhaka Bank" as TextEditingController;
                        //
                        //     break;
                        //   case 1:
                        //     _bankName = "AB Bank" as TextEditingController;
                        //     break;
                        //   case 3:
                        //     _bankName = "Brac Bank" as TextEditingController;
                        //     break;
                        // }
                      });



                    },
                      decoration: const InputDecoration(
                        labelText: "Choose Bank Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      ),

                  ),

                  

                  Divider(height: 24),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _accountName,
                    style: const TextStyle(fontSize: 15,color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Account Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),

                  Divider(height: 24),

                  SizedBox(height: 10,),
                  TextField(
                    controller: _accountNo,
                    style: const TextStyle(fontSize: 15,color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Account Number",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),

                  Divider(height: 24),

                  SizedBox(height: 10,),
                  TextField(
                    controller: _branch,
                    style: const TextStyle(fontSize: 15,color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Branch",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),


                  Divider(height: 24),

                  SizedBox(height: 10,),
                  TextField(
                    controller: _amount,
                    style: const TextStyle(fontSize: 15,color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),

                  Divider(height: 24),

                  SizedBox(height: 5,),
                  TextField(
                    controller: _message,
                    style: const TextStyle(fontSize: 15,color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Message",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),

                  Divider(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("A OTP code has been send to your phone",
                          style: primaryTextStyle(
                              color: Banking_TextColorSecondary,
                              size: 14,
                              fontFamily: fontRegular)),
                      TextField(
                        controller: _otp,
                        style: const TextStyle(fontSize: 15,color: Colors.purple),
                        decoration: const InputDecoration(
                          labelText: "Enter OTP",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(Banking_lbl_Resend,
                            style: primaryTextStyle(
                                size: 18, fontFamily: fontRegular))
                            .onTap(() {}),
                      ),
                      8.height,
                      Text("Use Face ID to verify transaction",
                          style: primaryTextStyle(
                              color: Banking_TextColorSecondary,
                              size: 14,
                              fontFamily: fontRegular)),
                      Image.asset(Banking_ic_face_id,
                          color: Banking_Primary, height: 40, width: 40)
                          .center()
                          .paddingOnly(top: 16, bottom: 16),
                    ],
                  ).visible(isGetOtp == true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save this Account",
                          style: primaryTextStyle(
                              color: Banking_TextColorSecondary,
                              size: 16,
                              fontFamily: fontRegular)),
                      Switch(
                        value: isSwitch,
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                            print(isSwitch);
                          });
                        },
                        activeTrackColor: Banking_Primary.withOpacity(0.5),
                        activeColor: Banking_Primary,
                      ),
                    ],
                  ).visible(isGetOtp == false),
                  Divider(height: 24),
                  16.height,
                  BankingButton(
                      textContent: isGetOtp == true
                          ? Banking_lbl_Confirm

                          : Banking_lbl_Get_OTP,


                      onPressed: () {
                        setState(
                              () {
                            isGetOtp = true;
                            tapCount = tapCount + 1;
                            tappedConfirm();
                          },
                        );
                      }).visible(isSwitch == true),
                  24.height,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
