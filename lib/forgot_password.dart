import 'package:dsi_app/constants.dart';
import 'package:dsi_app/infra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Image(
            image: Images.bsiLogo,
            height: 100,
          ),
          Constants.spaceSmallHeight,
          ForgotPasswordForm(),
          Spacer(),
        ],
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (!_formKey.currentState.validate()) return;

    DsiDialog.showInfo(
      context: context,
      message: 'Um email foi enviado para sua caixa de entrada.',
      buttonPressed: () => Navigator.of(context)..pop()..pop(),
    );

  }

  void _cancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: Constants.paddingMedium,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'E-mail*'),
              validator: (String value) {
                return value.isEmpty ? 'Email inválido.' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nova Senha*'),
              validator: (String value) {
                return value.isEmpty ? 'Senha inválida.' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration:
              const InputDecoration(labelText: 'Confirmação de Senha*'),
              validator: (String value) {
                return value.isEmpty
                    ? 'As senhas digitadas não são iguais.'
                    : null;
              },
            ),
            Constants.spaceMediumHeight,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Enviar'),
                onPressed: _register,
              ),
            ),
            FlatButton(
              child: Text('Cancelar'),
              padding: Constants.paddingSmall,
              onPressed: _cancel,
            ),
          ],
        ),
      ),
    );
  }
}
