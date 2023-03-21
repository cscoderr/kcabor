import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/accept_order/views/accept_order_page.dart';
import 'package:kabor/features/add_photo/add_photo.dart';
import 'package:kabor/features/address/presentation/presentation.dart';
import 'package:kabor/features/all_services/all_services.dart';
import 'package:kabor/features/authentication/presentation/login/login.dart';
import 'package:kabor/features/authentication/presentation/register/register.dart';
import 'package:kabor/features/book_service/views/book_service_page.dart';
import 'package:kabor/features/book_table/book_table.dart';
import 'package:kabor/features/booking_checkout/views/booking_checkout_page.dart';
import 'package:kabor/features/categories/categories.dart';
import 'package:kabor/features/categories_details/views/categories_details_page.dart';
import 'package:kabor/features/chat/views/chat_page.dart';
import 'package:kabor/features/earning_list/views/earning_list_page.dart';
import 'package:kabor/features/earnings/views/earnings_page.dart';
import 'package:kabor/features/express_pay/views/express_pay_page.dart';
import 'package:kabor/features/food/food.dart';
// import 'package:kabor/features/food/presentation/details/details.dart';
import 'package:kabor/features/home_artisan/views/home_artisan_page.dart';
import 'package:kabor/features/landing/view/landing_page.dart';
import 'package:kabor/features/menu/menu.dart';
import 'package:kabor/features/menu/payment/presentation/send_fund/send_fund.dart';
import 'package:kabor/features/menu/presentation/bag/view/bag_page.dart';
import 'package:kabor/features/menu/presentation/refer/view/refer_page.dart';
import 'package:kabor/features/menu/presentation/support/view/support_page.dart';
import 'package:kabor/features/menu/presentation/trip_details/trip_details.dart';
import 'package:kabor/features/menu/presentation/trips/view/trips_page.dart';
import 'package:kabor/features/menu/settings/presentation/cards/cards.dart';
import 'package:kabor/features/menu/settings/presentation/drive/drive.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/edit_profile.dart';
import 'package:kabor/features/menu/settings/presentation/legal/legal.dart';
import 'package:kabor/features/notifications/views/notification_page.dart';
import 'package:kabor/features/onboarding/view/onboarding_page.dart';
import 'package:kabor/features/order/order.dart';
import 'package:kabor/features/order/presentation/widgets/order_search.dart';
import 'package:kabor/features/pages/pages.dart';
import 'package:kabor/features/payment/views/add_card_page.dart';
import 'package:kabor/features/payment/views/payment_info_page.dart';
import 'package:kabor/features/promo_code/views/promo_code_page.dart';
import 'package:kabor/features/restaurant/restaurant.dart';
import 'package:kabor/features/restaurant_tracking/presentation/presentation.dart';
import 'package:kabor/features/review_booking/views/review_booking_page.dart';
import 'package:kabor/features/review_your_booking/views/review_your_bookings_page.dart';
import 'package:kabor/features/reviews/views/reviews_page.dart';
import 'package:kabor/features/reward/presentation/presentation.dart';
import 'package:kabor/features/ride/help/help.dart';
import 'package:kabor/features/ride/ride.dart';
import 'package:kabor/features/ride/selection/presentation/view/complete_ride_page.dart';
import 'package:kabor/features/ride/selection/presentation/view/rider_page.dart';
import 'package:kabor/features/search_restaurant/search_restaurant.dart';
import 'package:kabor/features/subcategories_details/views/subcategories_details_page.dart';
import 'package:kabor/features/tab/tab.dart';
import 'package:kabor/features/total_bookings/views/total_bookings_page.dart';
import 'package:kabor/features/total_bookings_details/views/total_bookings_details_page.dart';
import 'package:kabor/features/view_order/views/view_orders_page.dart';
import 'package:kabor/features/welcome/welcome.dart';

class AppRouter {
  AppRouter({required WidgetRef ref}) : _ref = ref {
    router = _router();
  }
  final WidgetRef _ref;

  late GoRouter router;

  static String initialLocation = AppRoutePaths.landing;

  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  GoRouter _router() {
    final kcaborRepository = _ref.read(kaborRepositoryProvider);
    // final authStatus =
    //     _ref.watch(appVMProvider.select((value) => value.authStatus));
    return GoRouter(
      initialLocation: AppRoutePaths.landing,
      routes: routes,
      redirect: (context, state) async {
        final authPages = [
          AppRoutePaths.login,
          AppRoutePaths.phoneNumber,
          AppRoutePaths.email,
          AppRoutePaths.referralCode,
          AppRoutePaths.createPassword,
          AppRoutePaths.changePassword,
          AppRoutePaths.codeVerification,
          AppRoutePaths.onBoarding,
        ];

        final user = await kcaborRepository.user;

        if (user != null && authPages.contains(state.location)) {
          return AppRoutePaths.authWelcome;
        }
        return null;
      },
      refreshListenable: AppRouterRefreshStream(kcaborRepository.authStatus),
    );
  }

  ///List of all the router
  static List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: AppRoutePaths.landing,
      name: AppRoutes.landing,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.onBoarding,
      name: AppRoutes.onBoarding,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.welcome,
      name: AppRoutes.welcome,
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.login,
      name: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.phoneNumber,
      name: AppRoutes.phoneNumber,
      builder: (BuildContext context, GoRouterState state) {
        return const PhoneNumberPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.codeVerification,
      name: AppRoutes.codeVerification,
      builder: (BuildContext context, GoRouterState state) {
        final phoneNumber = state.queryParams['phoneNumber'];
        final countryCode = state.queryParams['countryCode'];
        final email = state.queryParams['email'];
        return CodeVerificationPage(
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          verificationType: phoneNumber != null
              ? VerificationType.phone
              : VerificationType.email,
          email: email,
        );
      },
    ),
    GoRoute(
      path: AppRoutePaths.email,
      name: AppRoutes.email,
      builder: (BuildContext context, GoRouterState state) {
        return const EmailPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.fullName,
      name: AppRoutes.fullName,
      builder: (BuildContext context, GoRouterState state) {
        return const FullNamePage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.referralCode,
      name: AppRoutes.referralCode,
      builder: (BuildContext context, GoRouterState state) {
        return const ReferralPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.createPassword,
      name: AppRoutes.createPassword,
      builder: (BuildContext context, GoRouterState state) {
        return const CreatePasswordPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.termsAndConditions,
      name: AppRoutes.termsAndConditions,
      builder: (BuildContext context, GoRouterState state) {
        return const TermsAndConditionPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.notification,
      name: AppRoutes.notification,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.addCard,
      name: AppRoutes.addCard,
      builder: (BuildContext context, GoRouterState state) {
        return const AddCardPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.paymentInfo,
      name: AppRoutes.paymentInfo,
      builder: (BuildContext context, GoRouterState state) {
        return const PaymentInfoPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.addPhoto,
      name: AppRoutes.addPhoto,
      builder: (BuildContext context, GoRouterState state) {
        return const AddPhotoPage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.authWelcome,
      name: AppRoutes.authWelcome,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthWelcomePage();
      },
    ),
    GoRoute(
      path: AppRoutePaths.artisanTab,
      name: AppRoutes.artisanTab,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeArtisan();
      },
    ),
    GoRoute(
      path: AppRoutePaths.tab,
      name: AppRoutes.tab,
      builder: (BuildContext context, GoRouterState state) {
        return const TabPage();
      },
      routes: [
        GoRoute(
          path: AppRoutePaths.reward,
          name: AppRoutes.reward,
          builder: (BuildContext context, GoRouterState state) {
            return const RewardPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.liveLocation,
          name: AppRoutes.liveLocation,
          builder: (BuildContext context, GoRouterState state) {
            return const LiveLocationPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.pickup,
          name: AppRoutes.pickup,
          builder: (BuildContext context, GoRouterState state) {
            return const PickupPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.selection,
          name: AppRoutes.selection,
          builder: (BuildContext context, GoRouterState state) {
            return const SelectionPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.rider,
          name: AppRoutes.rider,
          builder: (BuildContext context, GoRouterState state) {
            return const RiderPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.help,
          name: AppRoutes.help,
          builder: (BuildContext context, GoRouterState state) {
            return const RideHelpPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.complete,
          name: AppRoutes.complete,
          builder: (BuildContext context, GoRouterState state) {
            return const CompleteRiderPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.requestPayment,
          name: AppRoutes.requestPayment,
          builder: (BuildContext context, GoRouterState state) {
            return const RequestPaymentPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.addAddress,
          name: AppRoutes.addAddress,
          builder: (BuildContext context, GoRouterState state) {
            return const AddAddressPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.searchRestaurant,
          name: AppRoutes.searchRestaurant,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchRestaurantPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.bookTable,
          name: AppRoutes.bookTable,
          builder: (BuildContext context, GoRouterState state) {
            return const BookTablePage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.reservation,
          name: AppRoutes.reservation,
          builder: (BuildContext context, GoRouterState state) {
            return const ReservationSuccessPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.food,
          name: AppRoutes.food,
          builder: (BuildContext context, GoRouterState state) {
            return const FoodPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.order,
          name: AppRoutes.order,
          builder: (BuildContext context, GoRouterState state) {
            return const OrderPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.orderDetails,
          name: AppRoutes.orderDetails,
          builder: (BuildContext context, GoRouterState state) {
            return const OrderDetailsPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.orderContact,
          name: AppRoutes.orderContact,
          builder: (BuildContext context, GoRouterState state) {
            return const OrderContactPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.orderReview,
          name: AppRoutes.orderReview,
          builder: (BuildContext context, GoRouterState state) {
            return const OrderReviewPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.restaurantTracking,
          name: AppRoutes.restaurantTracking,
          builder: (BuildContext context, GoRouterState state) {
            return const RestaurantTrackingPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.restaurantTrackingDetails,
          name: AppRoutes.restaurantTrackingDetails,
          builder: (BuildContext context, GoRouterState state) {
            return const RestaurantTrackingDetailsPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.restaurant,
          name: AppRoutes.restaurant,
          builder: (BuildContext context, GoRouterState state) {
            return RestaurantPage(
              title: state.queryParams['title'] as String,
              categoryId: state.queryParams['categoryId'] as String,
            );
          },
          routes: [
            GoRoute(
              path: AppRoutePaths.restaurantDetails,
              name: AppRoutes.restaurantDetails,
              builder: (BuildContext context, GoRouterState state) {
                return const RestaurantDetailsPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutePaths.payment,
          name: AppRoutes.payment,
          builder: (BuildContext context, GoRouterState state) {
            return const PaymentPage();
          },
          routes: [
            GoRoute(
              path: AppRoutePaths.addFund,
              name: AppRoutes.addFund,
              builder: (BuildContext context, GoRouterState state) {
                return const AddFundPage();
              },
              routes: [
                GoRoute(
                  path: AppRoutePaths.requestFund,
                  name: AppRoutes.requestFund,
                  builder: (BuildContext context, GoRouterState state) {
                    return const RequestFundPage();
                  },
                ),
                GoRoute(
                  path: AppRoutePaths.requestForm,
                  name: AppRoutes.requestForm,
                  builder: (BuildContext context, GoRouterState state) {
                    return const RequestFormPage();
                  },
                ),
              ],
            ),
            GoRoute(
              path: AppRoutePaths.wihdraw,
              name: AppRoutes.wihdraw,
              builder: (BuildContext context, GoRouterState state) {
                return const WithdrawPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.sendFund,
              name: AppRoutes.sendFund,
              builder: (BuildContext context, GoRouterState state) {
                return const SendFundPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutePaths.refer,
          name: AppRoutes.refer,
          builder: (BuildContext context, GoRouterState state) {
            return const ReferPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.service,
          name: AppRoutes.service,
          builder: (BuildContext context, GoRouterState state) {
            return const RestaurantTrackingDetailsPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.earning,
          name: AppRoutes.earning,
          builder: (BuildContext context, GoRouterState state) {
            return const RestaurantTrackingDetailsPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.chat,
          name: AppRoutes.chat,
          builder: (BuildContext context, GoRouterState state) {
            return const ChatPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.bag,
          name: AppRoutes.bag,
          builder: (BuildContext context, GoRouterState state) {
            return const BagPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.trip,
          name: AppRoutes.trip,
          builder: (BuildContext context, GoRouterState state) {
            return const TripsPage();
          },
          routes: [
            GoRoute(
              path: AppRoutePaths.tripDetails,
              name: AppRoutes.tripDetails,
              builder: (BuildContext context, GoRouterState state) {
                return const TripDetailsPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutePaths.booking,
          name: AppRoutes.booking,
          builder: (BuildContext context, GoRouterState state) {
            return const RestaurantTrackingDetailsPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.scheduledEvent,
          name: AppRoutes.scheduledEvent,
          builder: (BuildContext context, GoRouterState state) {
            return const ScheduledEventPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.confirmRide,
          name: AppRoutes.confirmRide,
          builder: (BuildContext context, GoRouterState state) {
            return const ConfirmRidePage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.confirmPickup,
          name: AppRoutes.confirmPickup,
          builder: (BuildContext context, GoRouterState state) {
            return const ConfirmPickupPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.connectRider,
          name: AppRoutes.connectRider,
          builder: (BuildContext context, GoRouterState state) {
            return const ConnectRiderPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.profile,
          name: AppRoutes.profile,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
          routes: [
            GoRoute(
              path: AppRoutePaths.editProfile,
              name: AppRoutes.editProfile,
              builder: (BuildContext context, GoRouterState state) {
                return const EditProfilePage();
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutePaths.settings,
          name: AppRoutes.settings,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsPage();
          },
          routes: [
            GoRoute(
              path: AppRoutePaths.changePassword,
              name: AppRoutes.changePassword,
              builder: (BuildContext context, GoRouterState state) {
                return const ChangePasswordPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.systemSettings,
              name: AppRoutes.systemSettings,
              builder: (BuildContext context, GoRouterState state) {
                return const SystemSettingsPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.menus,
              name: AppRoutes.menus,
              builder: (BuildContext context, GoRouterState state) {
                return const MenusPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.notifications,
              name: AppRoutes.notifications,
              builder: (BuildContext context, GoRouterState state) {
                return const NotificationsPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.defaultMenu,
              name: AppRoutes.defaultMenu,
              builder: (BuildContext context, GoRouterState state) {
                return const DefaultMenuPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.workEmail,
              name: AppRoutes.workEmail,
              builder: (BuildContext context, GoRouterState state) {
                return const WorkEmailPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.addEmail,
              name: AppRoutes.addEmail,
              builder: (BuildContext context, GoRouterState state) {
                return const AddEmailPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.changePhoneNumber,
              name: AppRoutes.changePhoneNumber,
              builder: (BuildContext context, GoRouterState state) {
                return const PhoneNumberPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.workAddress,
              name: AppRoutes.workAddress,
              builder: (BuildContext context, GoRouterState state) {
                return const WorkAddressPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.homeAddress,
              name: AppRoutes.homeAddress,
              builder: (BuildContext context, GoRouterState state) {
                return const HomeAddressPage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.cardAndBank,
              name: AppRoutes.cardAndBank,
              builder: (BuildContext context, GoRouterState state) {
                return const CardsPage();
              },
              routes: [
                GoRoute(
                  path: AppRoutePaths.debitCard,
                  name: AppRoutes.debitCard,
                  builder: (BuildContext context, GoRouterState state) {
                    return const DrivePage();
                  },
                ),
              ],
            ),
            GoRoute(
              path: AppRoutePaths.driveWithKaboor,
              name: AppRoutes.driveWithKaboor,
              builder: (BuildContext context, GoRouterState state) {
                return const DrivePage();
              },
            ),
            GoRoute(
              path: AppRoutePaths.legal,
              name: AppRoutes.legal,
              builder: (BuildContext context, GoRouterState state) {
                return const LegalPage();
              },
              routes: [
                GoRoute(
                  path: AppRoutePaths.policy,
                  name: AppRoutes.policy,
                  builder: (BuildContext context, GoRouterState state) {
                    return const PolicyPage();
                  },
                ),
                GoRoute(
                  path: AppRoutePaths.terms,
                  name: AppRoutes.terms,
                  builder: (BuildContext context, GoRouterState state) {
                    return const TermsAndConditionPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppRoutePaths.support,
          name: AppRoutes.support,
          builder: (BuildContext context, GoRouterState state) {
            return const SupportPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.categories,
          name: AppRoutes.categories,
          builder: (BuildContext context, GoRouterState state) {
            return const CategoriesPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.allServices,
          name: AppRoutes.allServices,
          builder: (BuildContext context, GoRouterState state) {
            return const AllServicesPage();
          },
        ),
        GoRoute(
          path: AppRoutePaths.categoriesDetails,
          name: AppRoutes.categoriesDetails,
          builder: (BuildContext context, GoRouterState state) {
            return const CategoriesDetails();
          },
        ),
        GoRoute(
          path: AppRoutePaths.subcategoriesDetails,
          name: AppRoutes.subcategoriesDetails,
          builder: (BuildContext context, GoRouterState state) {
            return const SubCategoriesDetails();
          },
        ),
        GoRoute(
          path: AppRoutePaths.reviews,
          name: AppRoutes.reviews,
          builder: (BuildContext context, GoRouterState state) {
            return const Reviews();
          },
        ),
        GoRoute(
          path: AppRoutePaths.bookings,
          name: AppRoutes.bookings,
          builder: (BuildContext context, GoRouterState state) {
            return const BookService();
          },
        ),
        GoRoute(
          path: AppRoutePaths.reviewBooking,
          name: AppRoutes.reviewBooking,
          builder: (BuildContext context, GoRouterState state) {
            return const ReviewBooking();
          },
        ),
        GoRoute(
          path: AppRoutePaths.reviewYourBooking,
          name: AppRoutes.reviewYourBooking,
          builder: (BuildContext context, GoRouterState state) {
            return const ReviewYourBooking();
          },
        ),
        GoRoute(
          path: AppRoutePaths.notificationPage,
          name: AppRoutes.notificationPage,
          builder: (BuildContext context, GoRouterState state) {
            return const Notificaition();
          },
        ),
        GoRoute(
          path: AppRoutePaths.bookingCheckout,
          name: AppRoutes.bookingCheckout,
          builder: (BuildContext context, GoRouterState state) {
            return const BookingCheckout();
          },
        ),
        GoRoute(
          path: AppRoutePaths.acceptOrder,
          name: AppRoutes.acceptOrder,
          builder: (BuildContext context, GoRouterState state) {
            return const AcceptOrder();
          },
        ),
        GoRoute(
          path: AppRoutePaths.totalBookings,
          name: AppRoutes.totalBookings,
          builder: (BuildContext context, GoRouterState state) {
            return const TotalBookings();
          },
        ),
        GoRoute(
          path: AppRoutePaths.totalBookingsDetails,
          name: AppRoutes.totalBookingsDetails,
          builder: (BuildContext context, GoRouterState state) {
            return const TotalBookingsDetails();
          },
        ),
        GoRoute(
          path: AppRoutePaths.chats,
          name: AppRoutes.chats,
          builder: (BuildContext context, GoRouterState state) {
            return const Chats();
          },
        ),
        GoRoute(
          path: AppRoutePaths.earnings,
          name: AppRoutes.earnings,
          builder: (BuildContext context, GoRouterState state) {
            return const Earnings();
          },
        ),
        GoRoute(
          path: AppRoutePaths.expressPay,
          name: AppRoutes.expressPay,
          builder: (BuildContext context, GoRouterState state) {
            return const ExpressPay();
          },
        ),
        GoRoute(
          path: AppRoutePaths.earningList,
          name: AppRoutes.earningList,
          builder: (BuildContext context, GoRouterState state) {
            return const EarningList();
          },
        ),
        GoRoute(
          path: AppRoutePaths.searchOrders,
          name: AppRoutes.searchOrders,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchOrders();
          },
        ),
        GoRoute(
          path: AppRoutePaths.viewOrders,
          name: AppRoutes.viewOrders,
          builder: (BuildContext context, GoRouterState state) {
            return const ViewOrders();
          },
        ),
        GoRoute(
          path: AppRoutePaths.promoCode,
          name: AppRoutes.promoCode,
          builder: (BuildContext context, GoRouterState state) {
            return const PromoCode();
          },
        ),
      ],
    ),
  ];
}
