import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:souza/data/http/http.dart';
import 'package:souza/data/usecases/usescases.dart';
import 'package:souza/domain/helpers/helpers.dart';
import 'package:souza/domain/usescases/authentication.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClientMock httpClient;
  late RemoteAuthentication sut;
  late String url;
  late AuthenticationParams params;
  final accessToken = faker.guid.guid();
  When mockRequest() {
    return when(() => httpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'),
        body: any(named: 'body')));
  }

  Map mockValidData() =>
      {'accessToken': accessToken, 'name': faker.person.name()};

  void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    httpClient = HttpClientMock();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    mockHttpData(mockValidData());
  });

  test('Should call HttpClient with correct values', () async {
    await sut.auth(params);

    verify(() => httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    mockHttpError(HttpError.badRequest);

    expect(sut.auth(params), throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockHttpError(HttpError.badRequest);

    expect(sut.auth(params), throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);
    final future = sut.auth(params);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsErros if HttpClient returns 401',
      () async {
    mockHttpError(HttpError.unathorized);

    final future = sut.auth(params);
    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if HttpClient returns 200', () async {
    final account = await sut.auth(params);

    expect(account.token, accessToken);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    mockHttpData({
      'invalidKey': 'invalid_value',
    });

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
