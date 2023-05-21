import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/constant.dart';
import 'login_action_section.dart';
import '../../../../../Core/widgets/password_form_field.dart';
import '../../../../../Core/widgets/email_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 1,
                child: Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 9.8,
                    backgroundColor: Colors.transparent,
                    child:
                    ClipOval(
                      child: Image.asset(
                       'assets/images/MAGNA.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  'Login',
                  style: Styles.style24B.copyWith(color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              EmailFormField(
                emailController: emailController,
              ),
              SizedBox(
                height: 10.h,
              ),
              PasswordFormField(
                  passwordController: passwordController,
                  ),
              SizedBox(
                height: 15.h,
              ),
              LoginActionSection(
                emailController: emailController,
                passwordController: passwordController,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
