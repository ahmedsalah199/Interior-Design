import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interior_design/core/utils/strings_manager.dart';

import '../cubit/app_cubit.dart';
import '../widgets/build_different_services.dart';
import '../widgets/build_list_category_home.dart';
import '../widgets/build_offers_packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getDifferentServices() =>
      BlocProvider.of<AppCubit>(context).getDifferentServices();

  @override
  void initState() {
    super.initState();
    _getDifferentServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.appName),
      ),
      body: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.getCubit(context);
            if (state is DifferentServicesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DifferentServicesSuccessState) {
              return ListView(
                children: [
                  BuildListViewCategory(cubit),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        BuildDifferentServices(state.services),
                        BuildOffersAndPackages(state.services),
                      ],
                    ),
                  )
                ],
              );
            } else if (state is DifferentServicesErrorState) {
              return Center(
                  child: Text(
                state.msg,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
            } else {
              return Container();
            }
          }),
    );
  }
}
