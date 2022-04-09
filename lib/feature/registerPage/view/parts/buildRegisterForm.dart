part of register_view.dart;

Form _buildRegisterForm(BuildContext context) {
    return Form(
                    key: context.read<RegisterCubit>().formKey,
                    child: Padding(
                      padding: context.horizontalPaddingLow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Padding(
                             padding: const EdgeInsets.only(bottom:16.0),
                             child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    selectGender(context,Icons.female,0,false),
                                     selectGender(context,Icons.male,1,true),
                                  ],
                                ),
                           ),
                          AuthTextField(
                              controller: context
                                  .read<RegisterCubit>()
                                  .nameController,
                              hintText: 'Name',
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().nameFocus,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'name is required'),
                               
                              ])),
                             AuthTextField(
                              controller: context
                                  .read<RegisterCubit>()
                                  .workNameController,
                                  
                              hintText: 'Your Job',
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().workNameFocus,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'job is required'),
                               
                              ])),
                       
                          
                          AuthTextField(
                              controller: context
                                  .read<RegisterCubit>()
                                  .emailController,
                              hintText: 'Email',
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().emailFocus,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'email is required'),
                                EmailValidator(
                                    errorText: 'please correct email')
                              ])),
                         
                          AuthTextField(
                            controller: context
                                .read<RegisterCubit>()
                                .passwordController,
                            hintText: 'Password',
                            isObsecure: true,
                            changeObscureCallBack: () {},
                            node: context.read<RegisterCubit>().passwordFocus,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'password is required'),
                              MinLengthValidator(8,
                                  errorText:
                                      'password must be at least 8 digits long'),
                             
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
  }
