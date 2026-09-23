import 'package:deskly_app/core/functions/app_snackbar.dart';
import 'package:deskly_app/features/home/manager/categoires_cubit/categoires_cubit.dart';
import 'package:deskly_app/features/home/view/widget/categories.dart';
import 'package:deskly_app/features/home/view/widget/categories_skeletonizer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesConsumerBuilder extends StatelessWidget {
  const CategoriesConsumerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoiresCubit, CategoiresState>(
      listener: (context, state) {
        if (state is CategoriesError) {
          AppSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is CategoriesEmptyResult) {
          return const Center(child: Text('No Categories Found'));
        }
        if (state is CategoriesLoaded) {
          return Categories(categories: state.categories);
        }

        return const CategoriesSkeletonizerLoading();
      },
    );
  }
}
