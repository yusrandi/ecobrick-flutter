import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:ecobrick_app/app/cores/core_strings.dart';
import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/data/models/user_model.dart';
import 'package:ecobrick_app/app/modules/home/views/home_view.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_constants.dart';
import '../../../cores/helper/keyboard.dart';
import '../controllers/auth_controller.dart';
import '../controllers/authentication_manager.dart';

class AuthView extends GetView<AuthController> {
  final AuthController authController = Get.put(AuthController());
  final AuthenticationManager authenticationManager =
      Get.put(AuthenticationManager());

  AuthView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _userPhone = TextEditingController();
  final _userName = TextEditingController();
  final _userNis = TextEditingController();
  final _userPass = TextEditingController();

  String? validateField(value) {
    if (value.isEmpty) {
      return kFieldNullError;
    } else {
      return null;
    }
  }

  String? validatePass(value) {
    if (value.isEmpty) {
      return kPassNullError;
    } else if (value.length < 8) {
      return kShortPassError;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    authenticationManager.checkLoginStatus();

    return Obx(
      () => Scaffold(
          backgroundColor: Colors.white,
          body: authenticationManager.isLogged.value
              ? HomeView()
              : body(size, context)),
    );
  }

  Container body(Size size, BuildContext context) {
    return Container(
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Form(
          key: _formKey,
          child: Obx(() => authController.count.value == 0
              ? loginPage(context)
              : regisPage(context)),
        ),
      ),
    );
  }

  loginPage(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Hi Agen ${CoreStrings.appName} !',
                style: CoreStyles.uTitle,
              ),
              Text(
                'Selamat Datang',
                style:
                    CoreStyles.uSubTitle.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Center(child: Image.asset(CoreImages.logoImage, height: 200)),
              const SizedBox(height: 8),
              TextFormField(
                  controller: _userNis,
                  validator: validateField,
                  cursorColor: CoreColor.primary,
                  keyboardType: TextInputType.text,
                  decoration: inputField('NISN', Icons.card_travel_rounded)),
              const SizedBox(height: 8),
              passwordField(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Lupa kata sandi ?',
                  style: CoreStyles.uContent,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    var nis = _userNis.text.trim();
                    var password = _userPass.text.trim();

                    KeyboardUtil.hideKeyboard(context);

                    await authController.userLogin(nis, password);
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  child: Center(
                      child: Obx(
                    () => authController.status.value == Status.running
                        ? loading()
                        : Text(
                            "Masuk",
                            style: CoreStyles.uSubTitle
                                .copyWith(color: Colors.white),
                          ),
                  )),
                ),
              ),
              Center(child: Image.asset(CoreImages.authBackImage, height: 300)),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            children: [
              Row(children: const <Widget>[
                Expanded(child: Divider(color: Colors.black)),
                SizedBox(width: 8),
                Text("OR"),
                SizedBox(width: 8),
                Expanded(child: Divider(color: Colors.black)),
              ]),
              GestureDetector(
                onTap: () => authController.count.value = 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Buat Akun',
                    style: CoreStyles.uSubTitle
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  loading() {
    return const CircularProgressIndicator(color: Colors.white);
  }

  regisPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => authController.count.value = 0,
          child: const SizedBox(
            height: 50,
            width: 50,
            child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios_new_outlined)),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Selamat Datang',
                  style: CoreStyles.uTitle,
                ),
                Text(
                  'Halo !, Daftar untuk memulai',
                  style: CoreStyles.uSubTitle
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _userName,
                    validator: validateField,
                    cursorColor: CoreColor.primary,
                    keyboardType: TextInputType.text,
                    decoration:
                        inputField('Nama Lengkap', Icons.card_membership)),
                const SizedBox(height: 8),
                TextFormField(
                    controller: _userNis,
                    validator: validateField,
                    cursorColor: CoreColor.primary,
                    keyboardType: TextInputType.text,
                    decoration: inputField('NISN', Icons.card_travel_rounded)),
                const SizedBox(height: 8),
                TextFormField(
                    controller: _userPhone,
                    validator: validateField,
                    cursorColor: CoreColor.primary,
                    keyboardType: TextInputType.number,
                    decoration: inputField('Nomor HP', Icons.phone)),
                const SizedBox(height: 8),
                passwordField(),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      var nis = _userNis.text.trim();
                      var password = _userPass.text.trim();
                      var name = _userName.text.trim();
                      var phone = _userPhone.text.trim();

                      KeyboardUtil.hideKeyboard(context);

                      await authController.userDaftar(
                          UserModel(code: nis, name: name, phone: phone),
                          password);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                    child: Center(
                        child: Obx(
                      () => authController.status.value == Status.running
                          ? loading()
                          : Text(
                              "Daftar",
                              style: CoreStyles.uSubTitle
                                  .copyWith(color: Colors.white),
                            ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Row(children: const <Widget>[
              Expanded(child: Divider(color: Colors.black)),
              SizedBox(width: 8),
              Text("OR"),
              SizedBox(width: 8),
              Expanded(child: Divider(color: Colors.black)),
            ]),
            GestureDetector(
              onTap: () => authController.count.value = 0,
              child: Text(
                'Sudah Punya Akun',
                style:
                    CoreStyles.uSubTitle.copyWith(fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  TextFormField emailField() {
    return TextFormField(
      cursorColor: CoreColor.primary,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'NIS / Email',
        labelStyle: const TextStyle(color: Colors.black),

        hintText: 'Masukkan NIS/Email anda',
        // Here is key idea
        prefixIcon:
            Icon(Icons.alternate_email_rounded, color: CoreColor.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CoreColor.primary, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.primaryExtraSoft,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.kHintTextColor,
            width: 1,
          ),
        ),
      ),
    );
  }

  passwordField() {
    return Obx(() => TextFormField(
          validator: validatePass,
          controller: _userPass,
          cursorColor: CoreColor.primary,
          keyboardType: TextInputType.text,
          obscureText: !authController
              .passwordVisible.value, //This will obscure text dynamically
          decoration: InputDecoration(
            labelText: 'Kata sandi',
            labelStyle: const TextStyle(color: Colors.black),

            hintText: 'Masukkan kata sandi anda',
            // Here is key idea
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                authController.passwordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: CoreColor.primary,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable

                authController.passwordVisible.value =
                    !authController.passwordVisible.value;
              },
            ),

            prefixIcon:
                Icon(Icons.lock_outline_rounded, color: CoreColor.primary),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: CoreColor.primary, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.primaryExtraSoft,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.kHintTextColor,
                width: 1,
              ),
            ),
          ),
        ));
  }

  InputDecoration inputField(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
      hintText: 'Masukkan $label',
      // Here is key idea
      prefixIcon: Icon(icon, color: CoreColor.primary, size: 20),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: CoreColor.primary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: CoreColor.primaryExtraSoft,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: CoreColor.kHintTextColor,
          width: 1,
        ),
      ),
    );
  }
}
