import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/common/custom_textfield.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/register/widgets/type_radio.dart';

enum UserType { individual, company } // Физлицо / Юрлицо

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Общие поля
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Физическое лицо
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController  = TextEditingController();
  final TextEditingController _iinController       = TextEditingController();
  final TextEditingController _contactsController  = TextEditingController();

  // Юридическое лицо
  final TextEditingController _binController       = TextEditingController();
  final TextEditingController _companyController   = TextEditingController();

  bool _passwordHidden = true;

  // Чекбоксы
  bool _agreePolicy = false;       // обязательно
  bool _pushAllowed = false;       // опционально
  bool _rememberMe = false;        // опционально

  UserType _type = UserType.individual;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _iinController.dispose();
    _contactsController.dispose();
    _binController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  void _submit() {
    // Простейшая валидация как в макетах: обязательные поля зависят от типа + согласие с политикой
    if (!_agreePolicy) {
      _showSnack('Нужно согласиться с политикой персональных данных');
      return;
    }

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnack('Заполните Email и Пароль');
      return;
    }

    if (_type == UserType.individual) {
      if (_lastNameController.text.isEmpty || _firstNameController.text.isEmpty || _iinController.text.isEmpty) {
        _showSnack('Заполните обязательные поля: Фамилия, Имя, ИИН');
        return;
      }
    } else {
      if (_binController.text.isEmpty || _companyController.text.isEmpty) {
        _showSnack('Заполните обязательные поля: БИН и Наименование компании');
        return;
      }
    }

    _showSnack('Ок! Отправляем форму (${_type == UserType.individual ? "Физлицо" : "Юрлицо"})');
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Регистрация пользователя',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Выберите тип пользователя',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.orangeColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TypeRadio<UserType>(
                    label: 'Физическое лицо',
                    value: UserType.individual,
                    groupValue: _type,
                    onChanged: (v) => setState(() => _type = v!),
                  ),
                  const SizedBox(width: 8),
                  TypeRadio<UserType>(
                    label: 'Юридическое лицо',
                    value: UserType.company,
                    groupValue: _type,
                    onChanged: (v) => setState(() => _type = v!),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (_type == UserType.individual) ...[
                _label('Фамилия *'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: 'Иванова',
                  controller: _lastNameController,
                ),
                const SizedBox(height: 8),

                _label('Имя *'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: 'Татьяна',
                  controller: _firstNameController,
                ),
                const SizedBox(height: 8),

                _label('ИИН *'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: 'XXXXXXXXXXXX',
                  controller: _iinController,
                ),
                const SizedBox(height: 8),

                _label('Контакты'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: '+7 (XXX) XXX-XX-XX',
                  controller: _contactsController,
                ),
                const SizedBox(height: 8),
              ] else ...[
                _label('БИН *'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: 'XXXXXXXXXXXX',
                  controller: _binController,
                ),
                const SizedBox(height: 8),

                _label('Наименование компании/организации'),
                const SizedBox(height: 4),
                CustomTextField(
                  hintText: 'OOO «Ваша компания»',
                  controller: _companyController,
                ),
                const SizedBox(height: 8),
              ],

              // Общие поля для обоих типов
              _label('Электронная почта *'),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'example@email.com',
                controller: _emailController, // <-- фикс
              ),
              const SizedBox(height: 8),

              _label('Пароль *'),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: '******************',
                controller: _passwordController,
                obscureText: _passwordHidden,
                suffix: GestureDetector(
                  onTap: () => setState(() => _passwordHidden = !_passwordHidden),
                  child: Icon(
                    _passwordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 16,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Согласия и политика
              _policyBlock(),

              const SizedBox(height: 4),

              // Войти 
              _label('Войти через:'),


              const SizedBox(height: 8),
              Column(
                children: [
                  CustomButton(
                    text: 'Зарегистрироваться',
                    onTap: _submit,
                    color: ColorStyles.primaryColor,
                    colorText: ColorStyles.whiteColor,
                  ),
                  CustomButton(
                    text: 'Отменить',
                    onTap: () => Navigator.of(context).maybePop(),
                    color: ColorStyles.greyColor,
                    colorText: ColorStyles.blackColor,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Ссылка "Есть аккаунт? Войти" — оставил из вашего дизайна
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Есть аккаунт? ',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: ColorStyles.blackColor)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.blackColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: ColorStyles.blackColor),
          ),
        ],
      );

  Widget _policyBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Согласие о предоставлении персональных данных',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: ColorStyles.blackColor),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: _agreePolicy,
              onChanged: (v) => setState(() => _agreePolicy = v ?? false),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
              },
                child: Text(
                  'Ознакомлен(а) с политикой персональных данных',
                  style: TextStyle(fontSize: 12, color: ColorStyles.blackColor, decoration: TextDecoration.none),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(value: _pushAllowed, onChanged: (v) => setState(() => _pushAllowed = v ?? false)),
            Expanded(
              child: Text('Получать push-уведомления',
                  style: TextStyle(fontSize: 12, color: ColorStyles.blackColor)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(value: _rememberMe, onChanged: (v) => setState(() => _rememberMe = v ?? false)),
            Expanded(
              child: Text('Запомнить меня (остаться в системе на 14 дней)',
                  style: TextStyle(fontSize: 12, color: ColorStyles.blackColor)),
            ),
          ],
        ),
      ],
    );
  }
}



