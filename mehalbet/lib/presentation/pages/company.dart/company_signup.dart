import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobportal/application/signup_bloc/signup_bloc.dart';
import 'package:jobportal/application/signup_bloc/signup_event.dart';
import 'package:jobportal/application/signup_bloc/signup_state.dart';
import 'package:jobportal/route_names.dart';
class CompanySignup extends StatefulWidget {
  const CompanySignup({super.key});

  @override
  State<CompanySignup> createState() => _CompanySignupState();
}

class _CompanySignupState extends State<CompanySignup> {
  final TextEditingController companyNameContoller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: companyNameContoller,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                
              
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
               
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: retypePasswordController,
                  decoration: InputDecoration(
                    labelText: 'Retype Password',
                  ),
                  obscureText: true,
                ),
              
               
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform sign up request
                    final Map<String, dynamic> userData = {
                      'companyName': companyNameContoller.text,
                       'email': emailController.text,
                      'password': passwordController.text,
                    };
                    context.read<SignupBloc>().add(
                          CompanySignUpRequested(userdata: userData),
                        );
                  },
                  child: Text('Sign Up'),
                ),
                TextButton(
                      onPressed: () {
                        context.goNamed(RouteNames.signup);
                      },
                      child: Text("Sign up as a freelancer?"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.goNamed(RouteNames.login);
                      },
                      child: Text("have an account ?"),
                    ),

              ],
            ),
          );
        },
      ),
    );
  }
}