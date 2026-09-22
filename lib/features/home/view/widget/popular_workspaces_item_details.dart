import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:deskly_app/features/home/view/widget/address_bloc_builder.dart';
import 'package:flutter/material.dart';

class PopularWorkspacesItemDetails extends StatelessWidget {
  const PopularWorkspacesItemDetails({super.key, required this.workspace});
  final WorkspaceEntity workspace;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                workspace.name,
                style: AppTextStyles.bold15(
                  context,
                ).copyWith(overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              const Spacer(),
              Text(
                "EGP ${workspace.price.toInt()}/",
                style: AppTextStyles.bold15(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
              Text(
                workspace.priceUnit,
                style: AppTextStyles.regular11(
                  context,
                ).copyWith(color: AppColors.mutedText),
              ),
            ],
          ),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColors.mutedPurple,
              ),
              const SizedBox(width: 5),
              AddressBlocBuilder(
                lat: workspace.latitude,
                lng: workspace.longitude,
              ),
              const SizedBox(width: 5),
              Text(
                "•",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.star, size: 14, color: Color(0xffFBBF24)),
              const SizedBox(width: 5),
              Text(
                workspace.rating.toStringAsFixed(1),
                style: AppTextStyles.semiBold12(context),
              ),
              const SizedBox(width: 5),
              Text(
                "(${workspace.reviewsCount})",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
