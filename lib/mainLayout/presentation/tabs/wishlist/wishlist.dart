import 'dart:developer';

import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/token_cubit/token_cubit.dart';
import 'package:e_commerce_app/core/token_cubit/token_state.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_product_widget.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/wishlistViewModel/wishlist_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/wishlistViewModel/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late String token;
  late WishlistCubit wishlistCubit;

  @override
  void initState() {
    wishlistCubit = WishlistCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCubit, TokenState>(
      builder: (context, tokenState) {
        if (tokenState is TokenSuccessState) {
          token = tokenState.token;
          return BlocProvider.value(
            value: wishlistCubit..getProductsFromWishlist(token: token),
            child: SafeArea(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    if (state is WishlistLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.lightBlue,
                        ),
                      );
                    } else if (state is WishlistErrorState) {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    } else if (state is WishlistSuccessState) {
                      return Column(
                        children: [
                          CustomAppBar(),
                          state.wishlistResponse.products!.isEmpty
                              ? SizedBox(
                                  height: 600.h,
                                  child: Center(
                                    child: Text(
                                      'Wishlist is Empty',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) => CustomProductWidget(
                                          onWishlistTapped: () {
                                            wishlistCubit
                                                .removeProductfromWishlist(
                                                    token: token,
                                                    productId:
                                                        state.wishlistResponse.products![index].id!)
                                                .then(
                                              (_) {
                                                wishlistCubit.getProductsFromWishlist(token: token);
                                              },
                                            );
                                          },
                                          onTap: () {
                                            log('added to cart!');
                                          },
                                          isWishlistTab: true,
                                          title: 'Add to Cart',
                                          productImage:
                                              state.wishlistResponse.products![index].imageCover!,
                                          productTitle:
                                              state.wishlistResponse.products![index].title!,
                                          productPrice:
                                              'EGP ${state.wishlistResponse.products![index].price!}',
                                          productCount: '1'),
                                      separatorBuilder: (context, index) => SizedBox(height: 10.h),
                                      itemCount: state.wishlistResponse.products!.length),
                                ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ),
          );
        }
        return Center(child: Text('Token Error'));
      },
    );
  }
}
