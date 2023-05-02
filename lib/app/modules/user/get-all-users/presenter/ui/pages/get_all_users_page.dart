import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../../shared/widgets/footer_widget.dart';
import '../../controllers/get_all_users_controller.dart';
import '../state/get_all_users_state.dart';

class GetAllUsersPage extends StatelessWidget {
  const GetAllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<GetAllUsersController>();
    return Center(
      child: SizedBox(
        width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
            ? ScreenHelper.width(context)
            : ScreenHelper.breakpointTablet,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                      ? 16
                      : 0),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (controller.state is LoadingGetAllState) {
                  return const CircularProgressIndicator();
                } else if (controller.state is ErrorGetAllState) {
                  return Text(
                      (controller.state as ErrorGetAllState).error.message);
                } else if (controller.state is SuccessGetAllState) {
                  return ListView.builder(
                    itemCount:
                        (controller.state as SuccessGetAllState).users.length,
                    itemBuilder: (context, index) {
                      var user =
                          (controller.state as SuccessGetAllState).users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              }),
              const Spacer(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
