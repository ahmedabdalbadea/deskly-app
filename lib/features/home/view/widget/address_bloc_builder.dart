import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/home/manager/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressBlocBuilder extends StatefulWidget {
  const AddressBlocBuilder({super.key, required this.lat, required this.lng});
  final double lat;
  final double lng;

  @override
  State<AddressBlocBuilder> createState() => _AddressBlocBuilderState();
}

class _AddressBlocBuilderState extends State<AddressBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().fetchAddress(lat: widget.lat, lng: widget.lng);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoaded) {
          return Text(
            "${state.address.administrativeArea.split(" ")[0]}, ${state.address.country}",
            style: AppTextStyles.regular12(context).copyWith(
              color: AppColors.mutedPurple,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          );
        }
        if (state is AddressError) {
          return Text(
            state.message,
            style: AppTextStyles.regular12(context).copyWith(
              color: AppColors.mutedPurple,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          );
        }
        return Skeletonizer(
          child: Text(
            "Cario, Egypt",
            style: AppTextStyles.regular12(
              context,
            ).copyWith(color: AppColors.mutedPurple),
          ),
        );
      },
    );
  }
}
