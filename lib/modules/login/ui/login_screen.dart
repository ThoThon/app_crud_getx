import 'package:app_crud_getx/login/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../controller/login_controller.dart';
import 'widgets/footer_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: _buildBodyPage(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconLogo(),
        const SizedBox(height: 24),
        _buildTaxCode(),
        const SizedBox(height: 24),
        _buildUserName(),
        const SizedBox(height: 24),
        _buildPassword(),
        const SizedBox(height: 30),
        _buttonLogin(),
        const SizedBox(height: 200),
        _buildBottom(),
        SizedBox(height: Get.mediaQuery.padding.bottom + 20),
      ],
    );
  }

  Widget _buildIconLogo() {
    return Container(
      padding: const EdgeInsets.only(top: 70, left: 16),
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        width: 180,
        height: 50,
      ),
    );
  }

  Widget _buildTaxCode() {
    return InputField(
      label: "Mã số thuế",
      controller: controller.taxController,
      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
      hintText: 'Mã số thuế',
      clearIconAsset: 'assets/icons/blank.svg',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Mã số thuế không được để trống';
        }
        if (value.length != 10) {
          return 'Mã số thuế phải bao gồm 10 số';
        }
        return null;
      },
    );
  }

  Widget _buildUserName() {
    return InputField(
        label: "Tài khoản",
        controller: controller.usernameController,
        hintText: 'Tài khoản',
        clearIconAsset: 'assets/icons/blank.svg',
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Tài khoản không được để trống';
          }
          return null;
        });
  }

  Widget _buildPassword() {
    return InputField(
      label: "Mật khẩu",
      controller: controller.passwordController,
      hintText: 'Mật khẩu',
      showPassword: true,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Mật khẩu không được để trống';
        }
        if (value.length < 6 || value.length > 50) {
          return 'Mật khóa chỉ từ 6 đến 50 ký tự';
        }
        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: 400,
        height: 60,
        child: Obx(
          () => ElevatedButton(
            onPressed:
                controller.isLoading.value ? null : () => _onLoginPressed(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: controller.isLoading.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Color(0xFFf24e1e),
                    ),
                  )
                : const Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() async {
    if (controller.formKey.currentState?.validate() ?? false) {
      final success = await controller.login();

      if (success) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.defaultDialog(
          title: "Lỗi",
          middleText: controller.errorMessage.value,
          backgroundColor: Colors.white,
          titleStyle: const TextStyle(color: Color(0xFFf24e1e)),
          middleTextStyle: const TextStyle(color: Color(0xFFf24e1e)),
          radius: 15,
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFf24e1e),
              ),
              child: const Text(
                "Đóng",
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterButton(
            svgAsset: 'assets/icons/headphone.svg',
            label: 'Trợ giúp',
            onTap: () => print('Trợ giúp được bấm'),
          ),
          FooterButton(
            svgAsset: 'assets/icons/facebook.svg',
            label: 'Group',
            onTap: () => print('Group được bấm'),
          ),
          FooterButton(
            svgAsset: 'assets/icons/search.svg',
            label: 'Tra cứu',
            onTap: () => print('Tra cứu được bấm'),
          ),
        ],
      ),
    );
  }
}
