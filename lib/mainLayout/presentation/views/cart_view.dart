import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/token_cubit/token_cubit.dart';
import 'package:e_commerce_app/core/token_cubit/token_state.dart';
import 'package:e_commerce_app/core/widgets/custom_action_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_counter_widget.dart';
import 'package:e_commerce_app/core/widgets/custom_total_price_widget.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/cartViewModel/cart_cubit.dart';
import 'package:e_commerce_app/mainLayout/presentation/views/viewModels/cartViewModel/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int productCount = 1;
  late CartCubit cartCubit;
  late String token;
  @override
  void initState() {
    super.initState();
    cartCubit = CartCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCubit, TokenState>(
      builder: (context, tokenState) {
        if (tokenState is TokenSuccessState) {
          token = tokenState.token;
          return BlocProvider.value(
            value: cartCubit..getCartDetails(token: token),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Cart', style: Theme.of(context).textTheme.titleMedium),
                actions: [
                  Padding(
                    padding: REdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        CustomActionWidget(iconUrl: IconsManager.search),
                      ],
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoadingState ||
                      state is LoadingAddProductState ||
                      state is LoadingDeleteProductOfCartState ||
                      state is LoadingUpdateCartState) {
                    return Center(
                      child: CircularProgressIndicator(color: ColorsManager.lightBlue),
                    );
                  } else if (state is CartSuccessState) {
                    return buildCartBody(context, state);
                  } else if (state is CartErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return SizedBox();
                },
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildCartBody(BuildContext context, CartSuccessState state) {
    return Padding(
      padding: REdgeInsets.only(top: 16, left: 16, right: 16, bottom: 50),
      child: Column(
        children: [
          SizedBox(
            height: 680.h,
            child: state.cartResponse.products!.isEmpty
                ? Center(
                    child: Text(
                    'Cart is Empty',
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.cartResponse.products!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 112.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: ColorsManager.lightBlue),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 112.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    state.cartResponse.products![index].productDM!.imageCover!,
                                  ),
                                ),
                                border: Border.all(color: ColorsManager.lightBlue),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: REdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(maxWidth: 200.w),
                                          child: Text(
                                            state.cartResponse.products![index].productDM!.title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cartCubit.deleteProductOfCart(
                                              token: token,
                                              productId: state
                                                  .cartResponse.products![index].productDM!.id!,
                                            );
                                          },
                                          child: Image.asset(
                                            IconsManager.delete,
                                            height: 26.h,
                                            width: 26.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'EGP ${state.cartResponse.products?[index].price ?? 0}',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                        CustomCounterWidget(
                                          title: '${state.cartResponse.products![index].count}',
                                          addFunction: () {
                                            cartCubit.updateProductCountInCart(
                                              token: token,
                                              productId: state
                                                  .cartResponse.products![index].productDM!.id!,
                                              count:
                                                  (state.cartResponse.products![index].count!) + 1,
                                            );
                                          },
                                          removeFunction: () {
                                            if (state.cartResponse.products![index].count! > 0) {
                                              cartCubit.updateProductCountInCart(
                                                token: token,
                                                productId: state
                                                    .cartResponse.products![index].productDM!.id!,
                                                count:
                                                    state.cartResponse.products![index].count! - 1,
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Spacer(),
          CustomTotalPriceWidget(
            totalPrice: state.cartResponse.totalCartPrice ?? 0,
            buttonTitle: 'Check Out',
            onPressed: () {},
            icon: Icons.arrow_forward_rounded,
          ),
        ],
      ),
    );
  }
}
