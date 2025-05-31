import 'dart:developer';

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController name = TextEditingController();

  final TextEditingController last = TextEditingController();

  final TextEditingController phone = TextEditingController();

  String? validation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    return null;
  }

  bool formValidated = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("First name"),
              MyTextField(
                messageText: "Please enter your first name",
                controller: name,
                validation: validation,
              ),
              SizedBox(height: 10),
              Text("Last name"),
              MyTextField(
                messageText: "Please enter your last name",
                controller: last,
                validation: validation,
              ),
              SizedBox(height: 10),
              Text("Phone number"),
              MyTextField(
                messageText: "Please enter your phone number",
                controller: phone,
                validation: validation,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    log("form is valid");
                  } else {
                    log("form is not valid");
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.validation,
    required this.messageText,
  });
  final TextEditingController controller;
  final String? Function(String?) validation;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: TextFormField(
        validator: validation,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0, fontSize: 10),
        ),
      ),
    );
  }
}
