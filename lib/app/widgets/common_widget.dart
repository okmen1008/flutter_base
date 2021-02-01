import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/app/widgets/text_style.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:get/get.dart';

import 'colors.dart';

void dialogYesNo(String title, BuildContext context, {Function() callback}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Không', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Có', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Get.back();

                      callback?.call();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void dialogAlert(String title, BuildContext context, {Function() callback}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Đóng', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Get.back();
                    callback?.call();
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

void dialogQuantities(String title, RxInt quantities, BuildContext context,
    {Function(int) callback, Function() remove}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Obx(() => Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('-',
                                style: TextStyle(color: Colors.white)),
                            onPressed: quantities.value > 0
                                ? () {
                                    quantities(quantities.value - 1);
                                  }
                                : null,
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12.0),
                              child: Text(quantities.value.toString(),
                                  style: Style.article1TextStyle.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                            )),
                        SizedBox(
                          width: 40,
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('+',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              quantities(quantities.value + 1);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Xác nhận',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Get.back();
                        callback(quantities.value);
                      },
                    ),
                  )
                ],
              ),
            )),
      );
    },
  );
}

Widget loading({Status status, BuildContext context}) => Visibility(
      visible: status == Status.loading,
      child: Container(
        alignment: Alignment.center,
        color: Colors.black12,
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );

Widget textField(
    {String hintText,
    String helperText,
    String labelText,
    Widget prefixIcon,
    String prefixText,
    String suffixText,
    FocusNode focusNode,
    int maxLines = 1,
    bool readOnly = false,
    Function() onTap,
    double padding = 12,
    @required TextEditingController textEditingController}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextField(
      maxLines: maxLines,
      focusNode: focusNode,
      onTap: onTap?.call(),
      readOnly: readOnly,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          helperText: helperText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          suffixText: suffixText),
    ),
  );
}

Widget showInformation({ProfileModel profileModel, BuildContext context, String endBankAccount}){
  return ListView(
    physics: BouncingScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileModel.avatar),
                  radius: 40,
                ),
                Table(
                  children: [
                    tableRow(textInformation('Tên'), textInformation(profileModel.name)),
                    tableRow(textInformation('Số điện thoại'), textInformation(profileModel.phone)),
                    tableRow(textInformation('Nick name'),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: profileModel.nicknames.map((e){
                            return textInformation(e);
                          }).toList(),
                        )
                    ),
                    tableRow(
                        textInformation('Facebook Link'),
                        IconButton(
                            icon: Icon(Icons.link, color: peacockBlue),
                            onPressed: null
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Table(
                  children: [
                    tableRow(textInformation('Tên ngân hàng'), textInformation(profileModel.bankName)),
                    tableRow(textInformation('Chi nhánh ngân hàng'), textInformation(profileModel.branchName)),
                    tableRow(textInformation('Tên chủ tài khoản'), textInformation(profileModel.bankOwnerAccount)),
                    tableRow(textInformation('Tài khoản'), textInformation('***********$endBankAccount'))
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
BoxDecoration boxDecoration(){
  return BoxDecoration(
      border: Border.all(
          color: Colors.blue,
          width: 2.0
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(15)
      )
  );
}
TableRow tableRow(Widget widget1, Widget widget2){
  return TableRow(
      children: [
        widget1, widget2
      ]
  );
}
Widget textInformation(String text){
  return Text(
    text,
    style: Style.h7TextStyle.copyWith(color: peacockBlue),
  );
}

Widget textFormField({
  String initialValue,
  String labelText,
  Function change,
}) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: change,
        decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: labelText),
      ),
    ),
  );
}

