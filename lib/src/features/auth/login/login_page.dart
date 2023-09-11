import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/widgets/TextFormField/textformfield_widget.dart';
import '../../../core/widgets/logo/app_logo_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //     title: const Text('Login page'),
      //   ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  // set height of login page
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const AppLogoLoginWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                label: 'E-Mail',
                                controller: _emailEC,
                                focusNode: _emailFocus,
                                validator: Validatorless.multiple([Validatorless.required('E-mail obrigatório'), Validatorless.email('E-mail inválido')]),
                              ),
                              const SizedBox(height: 20),
                              TextFormFieldWidget(
                                label: 'Senha',
                                obscureText: true,
                                controller: _passwordEC,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Senha obrigatória'),
                                  Validatorless.min(6, 'Senha deve ter pelo menos 6 caracteres'),
                                ]),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Forgot password?'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Login'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF0F3F7),
                            border: Border(
                              top: BorderSide(
                                width: 2,
                                color: Colors.grey.withAlpha(50),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              SignInButton(
                                Buttons.Google,
                                text: 'Continue com Google',
                                padding: const EdgeInsets.all(5),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                onPressed: () {
                                  // context.read<LoginController>().googleLogin();
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Não tem conta?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('/register');
                                    },
                                    child: const Text('Cadastre-se'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
