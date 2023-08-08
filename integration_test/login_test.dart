import 'package:blood_buddy/config/router/app_route.dart';
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
  late AuthUseCase mockAuthUseCase;

  //We are doing these for dashboard
  late bool isLogin;

  setUpAll(() async {
    //because these mocks are already created in the register_view_test.dart file
    mockAuthUseCase = MockAuthUseCase();
    isLogin = true;
  });

  testWidgets('login test with email and password and open dashboard page', 
  (WidgetTester tester) async {
    when(mockAuthUseCase.loginUser('jas@gmail.com', 'jas123'))
        .thenAnswer((_) async => Right(isLogin));

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
            authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
            ], 
            child: MaterialApp(
              initialRoute: AppRoute.loginRoute,
              routes: AppRoute.getApplicationRoute(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        //find the first textfield and enter the text
        await tester.enterText(find.byType(TextFormField).at(0),'jas@gmail.com');
        //find the second textfield and enter the text
        await tester.enterText(find.byType(TextFormField).at(1),'jas123');

        //find the login button and tap on it
        await tester.tap(find.widgetWithText(ElevatedButton, 'Login'),
        );
        await tester.pumpAndSettle();
        expect(find.text('Successfully Logged In!!!'), findsOneWidget);
    }); 
  }