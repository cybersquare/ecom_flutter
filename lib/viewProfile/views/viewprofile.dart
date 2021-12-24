import 'package:csecom/router/router_constants.dart';
import 'package:csecom/viewProfile/viewprofile.dart';
import 'package:csecom/viewProfile/views/widgets/edit_address_popup.dart';
import 'package:csecom/viewProfile/views/widgets/profile_header.dart';
import 'package:csecom/viewProfile/views/widgets/user_address_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/profile_details_list.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({Key? key}) : super(key: key);
  // String name = 'surya';
  // String email = 'suryakian@baabte.com';
  // String mob = '8606326406';
  final TextEditingController userNameController =
      TextEditingController(text: '');
  final TextEditingController userEmailController =
      TextEditingController(text: '');
  final TextEditingController userPhoneController =
      TextEditingController(text: '+91 8606326406');
  TextEditingController adressController = TextEditingController(text: '');
  final ViewprofileBloc viewprofileBloc = ViewprofileBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => viewprofileBloc..add(LoadProfileDetailsEvent()),
        child: BlocBuilder<ViewprofileBloc, ViewprofileState>(
          builder: (context, state) {
            print(state);
            if (state is ProfileUpdatedState) {
              print('Hsaafdsfsd');
              viewprofileBloc.add(LoadProfileDetailsEvent());
            }
            if (state is NavigateToLoginState) {
              print("logout navigation start");
              // ignore: avoid_dynamic_calls
              Navigator.pushNamed(context, RouteConstants.loginRoute);
            }

            if (state is LoadProfileDetailsState) {
              userEmailController.text = state.userData.email;
              userNameController.text = state.userData.fullName;
              adressController.text = state.userData.address;
              // String userEmail = state.userData.email;
              // name = ;
              print(state.userData.email);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.blueGrey[50],
                  toolbarHeight: MediaQuery.of(context).size.width / 3,
                  title: ProfileHeader(
                    email: state.userData.email,
                    name: state.userData.fullName,
                    mob: '8606xxxxxx',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        showDialog<dynamic>(
                          context: context,
                          builder: (BuildContext context) {
                            return UserUpdatePopup(
                              email: userEmailController,
                              userName: userNameController,
                              phoneNo: userPhoneController,
                              viewprofileBloc: viewprofileBloc,
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ProfileDetails(
                    address: adressController,
                    viewprofileBloc: viewprofileBloc,
                  ),
                ),
              );
            } else if (state is ViewProfileLoadingIndicationState) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
