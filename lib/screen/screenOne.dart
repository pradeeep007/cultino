import 'package:cached_network_image/cached_network_image.dart';
import 'package:cultino/data/hive/gender/gender.dart';
import 'package:cultino/data/hive/profileHive.dart';
import 'package:cultino/data/hiveboxes/boxes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  File? _image;
  bool emailvaild = false;

  bool validateForm({
    required Gender? gender,
    required String email,
    required String name,
    required File? image,
  }) {
    print("called vaidate forrm $email  $name ");
    if (EmailValidator.validate(email) == false) {
      return false;
    }
    if (Gender == null) {
      return false;
    }
    if (name == "") {
      return false;
    }
    if (image == null) {
      return false;
    }
    return true;
  }

  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    final savedImage = await File(photo!.path)
        .copy('${directory.path}/${photo!.path.split("/").last}');

    setState(() {
      _image = savedImage;
    });
  }

  late TextEditingController titleController = TextEditingController(
    text: null,
  );
  late TextEditingController email = TextEditingController(text: null);
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(hintText: "Enter Name"),
                controller: titleController,
              ),
              SizedBox(
                height: 8,
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  validator: (value) {
                    emailvaild = EmailValidator.validate(value!);
                    return emailvaild ? null : "Please enter a valid email";
                  },
                  onChanged: (s) {
                    print(s);
                    setState(() {});
                  },
                  controller: email,
                  decoration: InputDecoration(hintText: "Enter Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<Gender>(
                        title: Text("Male"),
                        value: Gender.Male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile<Gender>(
                        title: Text("Female"),
                        value: Gender.Female,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(),
                  child: Text(
                    _image == null ?"Capture Image": "Recapture Image",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: getImage),
              Builder(builder: (context) {
                if (_image != null) {
                  return Image.file(
                    File(_image!.path),
                    width: 120,
                    height: 120,
                  );
                } else {
                  return Text("select Image");
                }
              }),
              ElevatedButton(
                style: ButtonStyle(),
                child: Text(
                  "Add Data",
                ),
                onPressed: validateForm(
                            email: email.text,
                            name: titleController.text,
                            image: _image,
                            gender: _gender) ==
                        false
                    ? null
                    : () {
                        Profile data = Profile(
                            name: titleController.text,
                            email: email.text,
                            gender: _gender!,
                            path: _image!.path);

                        final box = Boxes.getProfile();
                        box.add(data).whenComplete(() {
                          print("profile uploaded");
                          setState(() {
                            titleController.clear();
                            email.clear();
                            _image = null;
                            _gender = null;
                          });
                        });
                      },
              )
            ],
          ),
        ),
        ValueListenableBuilder<Box<Profile>>(
          valueListenable: Boxes.getProfile().listenable(),
          builder: (context, box, _) {
            final profileList = box.values.toList().cast<Profile>();

            return SliverList(
              delegate: SliverChildBuilderDelegate((ctx, index) {
                final Profile profile = profileList[index];
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  resizeDuration: Duration(milliseconds: 200),
                  key: ObjectKey(profile),
                  onDismissed: (direction) {
                    _deleteItem(index);
                  },
                  background: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red,
                              offset: Offset(0.0, 0.1),
                              blurRadius: 2.0),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red,
                              offset: Offset(0.0, 0.1),
                              blurRadius: 2.0),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Image.file(
                          File(profile.path),
                          width: 100,
                          height: 100,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 100,
                              width: 100,
                              child: const Center(
                                child: const Text(
                                  "Not Found ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Name: ${profile.name}"),
                              Text("email : ${profile.email}"),
                              Text(
                                  "gender : ${profile.gender.toString().split(".").last}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: profileList.length),
            );
          },
        ),
      ],
    );
  }
}

_deleteItem(int index) {
  final box = Hive.box<Profile>("profile");
  box.deleteAt(index);
}
