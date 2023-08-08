import 'package:blood_buddy/config/router/app_route.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:blood_buddy/features/auth/domain/use_case/auth_usecase.dart';
import 'package:blood_buddy/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test/unit_test/auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late UserEntity userEntity;

  setUpAll(() {
    mockAuthUsecase = MockAuthUseCase();

    userEntity = const UserEntity(
      fname: 'Jasmine Osti',
      email: 'jas@gmail.com',
      phone: '1234567890',
      password: 'jas123',
      confirmpassword: 'jas123',
    );
  });

  testWidgets('register test', (tester) async {
    when(mockAuthUsecase.registerUser(userEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockAuthUsecase),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter full name in first textform field
    await tester.enterText(find.byType(TextFormField).at(0), 'Jasmine Osti');
    // Enter email in second textform field
    await tester.enterText(find.byType(TextFormField).at(1), 'jas@gmail.com');
    // Enter phone no
    await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
    // Enter password
    await tester.enterText(find.byType(TextFormField).at(3), 'jas123');
    // Confirm password
    await tester.enterText(find.byType(TextFormField).at(4), 'jas123');

    // Find the register button
    final registerButtonFinder =
        find.widgetWithText(ElevatedButton, 'Register');

    await tester.ensureVisible(registerButtonFinder);
    await tester.tap(registerButtonFinder);

    await tester.pump(); // Pump the widget tree to update it

    // Wait for the SnackBar to appear
    await tester.pump(const Duration(seconds: 1));

    // Check if a SnackBar is present
    final snackBarFinder = find.byType(SnackBar);
    expect(snackBarFinder, findsOneWidget);

    // Check the SnackBar content
    final snackBarWidget = tester.widget<SnackBar>(snackBarFinder);
    expect(snackBarWidget.content, isA<Text>());
    expect((snackBarWidget.content as Text).data, 'Registered Successfully');
  });
}
