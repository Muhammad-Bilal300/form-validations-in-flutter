import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_validations/abc.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final formkey = GlobalKey<FormState>();
  final emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Form Validations",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: [AutofillHints.email],
                  controller: emailController,
                  autovalidate: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required *"),
                    EmailValidator(errorText: "Not a valid email address.")
                  ]),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autovalidate: true,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Password is required";
                      //   } else if (value.length < 6) {
                      //     return "Your Password must be 6 characters or above";
                      //   } else if (value.length > 15) {
                      //     return "Your Password should not exceed 15 characeters";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(8,
                            errorText:
                                'password must be at least 8 digits long'),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            errorText:
                                'passwords must have at least one special character'),
                        MaxLengthValidator(15,
                            errorText: "Password does not exceed 15 characters")
                      ]),
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "password"),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print("Validated");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Abc()));
                          emailController.text = "";
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Text("Login"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
