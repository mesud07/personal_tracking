part of profilepageview.dart;

  GestureDetector _buildQRCodeButton(BuildContext context) {
    return GestureDetector(
                                    onTap: () => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => QrScannerPage()),
                                        (route) => false),
                                    child: Container(
                                        height: context.height / 6,
                                        child: Lottie.asset(
                                            ProfilePageStrings.qrAsset)),
                                  );
  }