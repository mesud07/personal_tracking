  part of profilepageview.dart;
  Align _buildPermissionContainer(BuildContext context) {
    return Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, top: 50,bottom: 20),
                                  child: CustomButton(
                                      text: ProfilePageStrings.permissionButtonText,
                                    
                                      func: () =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AllowingPageView()),
                                              (route) => false),
                                               isloading: false,),
                                ),
                              );
  }