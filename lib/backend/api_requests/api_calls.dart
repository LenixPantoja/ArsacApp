import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

String username = "";
String token = "";

/// Start ApiArsac Group Code
class Usuario {
  String nombreUsuario = username;
  String tokenUsuario = token;

  String getNombreUsuario() {
    return nombreUsuario;
  }

  String getTokenUsuario() {
    return tokenUsuario;
  }
}

class ApiArsacGroup {
  static String baseUrl = 'https://06e8-8-242-169-8.ngrok-free.app/';
  static Map<String, String> headers = {};
  static ApiLoginCall apiLoginCall = ApiLoginCall();
  static ApiGetUserCall apiGetUserCall = ApiGetUserCall();
  static ApiDocenteCall apiDocenteCall = ApiDocenteCall();
  static ApiEstudiantesCall apiEstudiantesCall = ApiEstudiantesCall();
  static ApiCrearHorarioCall apiCrearHorarioCall = ApiCrearHorarioCall();
  static ApiParticipanteCall apiParticipanteCall = ApiParticipanteCall();
  static ApiCrearMateriaCall apiCrearMateriaCall = ApiCrearMateriaCall();
  static ApiCrearPeriodoCall apiCrearPeriodoCall = ApiCrearPeriodoCall();
  static ApiCrearCursoCall apiCrearCursoCall = ApiCrearCursoCall();
  static ApiAsistenciaEstudianteCall apiAsistenciaEstudianteCall =
      ApiAsistenciaEstudianteCall();
  static ApiObservacionesEstudianteCall apiObservacionesEstudianteCall =
      ApiObservacionesEstudianteCall();
  static ApiMateriasPorDocente ApiMateriasDocentes = ApiMateriasPorDocente();
}

class ApiLoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
        "username": "${username}",
        "password": "${password}"
}   ''';
    final response = await ApiManager.instance.makeApiCall(
      callName: 'ApiLogin',
      apiUrl: '${ApiArsacGroup.baseUrl}api/Login/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );

    if (response.statusCode == 200) {
      token = response.jsonBody["access"];
      print(token);
    } else {
      print(
          "Error al llamar a la API Login. Código de estado: ${response.statusCode}");
    }
    return response;
  }
}

// Api para obtener el nombre del usuario
class ApiGetUserCall {
  Future<Map<String, dynamic>> fetchUsername() async {
    try {
      final String apiUrl = '${ApiArsacGroup.baseUrl}/api/getUser/';
      final http.Response response = await http
          .get(Uri.parse(apiUrl), headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
       
        return jsonData;
      } else {
        print(
            "Error al llamar a la API. Código de estado: ${response.statusCode}");
        return {};
      }
    } catch (error) {
      print("Error al llamar a la API obtener username: $error");
      return {};
    }
  }
}

class ApiMateriasPorDocente {
  Future<List<dynamic>> fetchMaterias() async {
    try {
      final String apiUrl =
          '${ApiArsacGroup.baseUrl}/api/MateriasDocente/?pUser=$username';

      final http.Response response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData;
      } else {
        print(
            "Error al llamar a la API. Código de estado: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      print("Error al llamar a la API materias por Docente: $error");
      return [];
    }
  }
}

class ApiDocenteCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiDocente',
      apiUrl: '${ApiArsacGroup.baseUrl}api/Docente/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwNTQ4MjkxLCJpYXQiOjE3MTA0NzYyOTEsImp0aSI6IjE4Yjg5MGJiMGQzYzRiZWRiOTI2NTlhZmY3N2ZhMTFjIiwidXNlcl9pZCI6MX0.1ZVUi6xCqI6Bu8dkS1pEhj9AqkEKbyqWazx0SloPr9g',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiEstudiantesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiEstudiantes',
      apiUrl: '${ApiArsacGroup.baseUrl}api/Estudiantes',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCrearHorarioCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiCrearHorario',
      apiUrl: '${ApiArsacGroup.baseUrl}api/crearHorario/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiParticipanteCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiParticipante',
      apiUrl: '${ApiArsacGroup.baseUrl}api/Participante',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCrearMateriaCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiCrearMateria',
      apiUrl: '${ApiArsacGroup.baseUrl}api/crearMateria/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCrearPeriodoCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiCrearPeriodo',
      apiUrl: '${ApiArsacGroup.baseUrl}api/crearPeriodo/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCrearCursoCall {
  Future<ApiCallResponse> call({
    String? pDocente = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiCrearCurso',
      apiUrl: '${ApiArsacGroup.baseUrl}api/crearCurso/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'pDocente': "lenix",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAsistenciaEstudianteCall {
  Future<ApiCallResponse> call({
    String? tipoAsistencia = 'presenteGeneral5',
    String? descripcion = 'descripcion anticuiada',
    String? horaLlegada = '2024-04-26 14:00',
    String? estudiante = '1',
    String? curso = '7',
    String? soporte = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiAsistenciaEstudiante',
      apiUrl: '${ApiArsacGroup.baseUrl}api/AsistenciaEstudiante/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwNTUxNTg0LCJpYXQiOjE3MTA0Nzk1ODQsImp0aSI6ImIzNmU3YzQzNzJmZjQyZmQ4MTc1ZDY5YTYxODQ3ZDgzIiwidXNlcl9pZCI6MX0.jM9OCuPdYGFjqYnIce4MnPt0ldvv4BmbsnLB5Mk2iyQ',
      },
      params: {
        'tipo_asistencia': tipoAsistencia,
        'descripcion': descripcion,
        'hora_llegada': horaLlegada,
        'estudiante': estudiante,
        'curso': curso,
        'soporte': soporte,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiObservacionesEstudianteCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApiObservacionesEstudiante',
      apiUrl: '${ApiArsacGroup.baseUrl}api/ObservacionesEstudiante/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ApiArsac Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
