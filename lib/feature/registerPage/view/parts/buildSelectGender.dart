part of register_view.dart;
InkWell selectGender(BuildContext context,IconData icon,int index,bool deger) {
    return InkWell(
                    onTap: (){
                    if(index==0){
                      context.read<RegisterCubit>().changeGender(false);
                    }
                    else{
                        context.read<RegisterCubit>().changeGender(true);
                    }
                     
                    
                    },
                    child: Column(
                      children: [
                        Container(
                          
                          height: context.height/10,
                          width: MediaQuery.of(context).size.width*2/10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                        BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                          ),
                          ],
                            color: Colors.white),
                          child: Icon(icon,size: context.height/10,
                          color: 
                           context.read<RegisterCubit>().ismen==deger && icon==Icons.female?Colors.red:
                          context.read<RegisterCubit>().ismen== deger && icon==Icons.male?Colors.black:Colors.grey),
                  
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(index==0?"Woman":"Men")),
                      ],
                    ),
                  );
  }