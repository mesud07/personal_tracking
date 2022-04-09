  part of profilepageview.dart;
  Container _buildAvatarImage(BuildContext context) {
    return 
     Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10)
       ),
       padding: context.paddingLow,
       child: Image.asset(context.read<ProfileCubit>().user?.ismen==false?"assets/images/man.png":"assets/images/women.png",
                                      height: context.height / 7,
                                      width: context.width / 4,
                                    
                                      
                                    ),
     );
  }
