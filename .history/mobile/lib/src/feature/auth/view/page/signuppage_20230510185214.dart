import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:predict/src/commom/form_text_field.dart';
import '../../view_model/auth_viewmodel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late ColorScheme _colors;
  late ThemeData _theme;
  final store = AuthViewmodel();

  Widget get _loadingIndicator => Visibility(
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
        visible: store.loading,
      );

  Widget get _password => widget.createFormField(
        title: 'password'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'password_hint'.i18n(),
        enabled: !store.loading,
        onChange: (value) => store.password = value,
      );

  Widget get _repassword => widget.createFormField(
        title: 'repassword'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'repassword_hint'.i18n(),
        enabled: !store.loading,
        onChange: (value) => store.password = value,
      );

  Widget get _email => widget.createFormField(
        title: 'email'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'email_hint'.i18n(),
        enabled: !store.loading,
        onChange: (value) => store.email = value,
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('signup'.i18n())),
      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _loadingIndicator,
                  const SizedBox(height: 5),
                  _password,
                  _repassword,
                  _email,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}