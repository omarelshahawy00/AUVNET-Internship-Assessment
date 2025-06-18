import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nawel/core/utils/assets_manager.dart';

enum DialogType { success, failure, loading, mail }

class CustomDialog extends StatelessWidget {
  final DialogType type;
  final String message;
  final VoidCallback? onConfirm;

  const CustomDialog({
    super.key,
    required this.type,
    required this.message,
    this.onConfirm,
  });

  String _getAnimationPath() {
    switch (type) {
      case DialogType.success:
        return AssetsManager.success; // Add success Lottie file
      case DialogType.mail:
        return AssetsManager.mail; // Add mail Lottie file
      case DialogType.failure:
        return AssetsManager.fail; // Add failure Lottie file
      case DialogType.loading:
        return AssetsManager.loading; // Add loading Lottie file
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(_getAnimationPath(), width: 100, height: 100),
          const SizedBox(height: 10),
          Text(message, textAlign: TextAlign.center),
          if (type != DialogType.loading) ...[
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onConfirm != null) onConfirm!();
              },
              child: const Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ]
        ],
      ),
    );
  }
}

Future<void> showCustomDialog({
  required BuildContext context,
  required DialogType type,
  required String message,
  VoidCallback? onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) => CustomDialog(
      type: type,
      message: message,
      onConfirm: onConfirm,
    ),
  );
}
