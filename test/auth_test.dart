import 'package:mynotes/services/auth/auth_exception.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Mock Authentication', () {
    final provider = MockAuthProvider();
    test('should not be  initialized to begin with', () {
      expect(provider._isInitialize, false);
    });
    test("cannot log out  if not initialized", () {
      expect(
        provider.logOut(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
    test(
      "should be able to initialized ",
      () async {
        await provider.initialize();
        expect(provider.isInitialize, true);
      },
    );

    test(
      'user should be null after initialization',
      () {
        expect(provider.currentuser, null);
      },
    );

    test('should be able to initailize in less tha 2 sec', () async {
      await provider.initialize();
      expect(provider.isInitialize, true);
    }, timeout: const Timeout(Duration(seconds: 2)));

    test(
      'create user should delegate to login fucntion',
      () async {
        final badEmailUser = provider.createUser(
          email: 'foobar.com',
          password: 'anypassword',
        );

        expect(
          badEmailUser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()),
        );

        final badPasswordUser = provider.createUser(
          email: 'someone@gmail.com',
          password: 'foobar',
        );

        expect(
          badPasswordUser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()),
        );

        final user = await provider.createUser(
          email: 'foo',
          password: 'bar',
        );
        expect(provider.currentuser, user);
        expect(user.isEmailVerified, false);
      },
    );

    test(
      'logged in user able to verified',
      () {
        provider.sendEmailVerification();
        final user = provider.currentuser;
        expect(user, isNotNull);
        expect(user!.isEmailVerified, true);
      },
    );

    test(
      'should be able to logout and login again',
      () async {
        await provider.logOut();
        await provider.logIn(
          email: 'email',
          password: 'password',
        );
        final user = provider.currentuser;
        expect(user, isNotNull);
      },
    );
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialize = false;
  bool get isInitialize => _isInitialize;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialize) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentuser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialize = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (!isInitialize) throw NotInitializedException();
    if (email == 'foobar.com') throw UserNotFoundAuthException();
    if (password == 'foobar') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false, email: 'foo@bar.com');
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialize) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialize) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser(isEmailVerified: true, email: 'foo@bar.com');
    _user = newUser;
  }
}
