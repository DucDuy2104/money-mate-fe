class ApiRequest {
  final String url;
  final Map<String, dynamic>? query;
  final Object? body;
  final Map<String, dynamic>? headers;

  ApiRequest({
    required this.url,
    this.query,
    this.body,
    this.headers,
  });

  // Helper method to merge default headers with custom headers
  Map<String, String> mergeHeaders(Map<String, dynamic> defaultHeaders) {
    return {
      ...defaultHeaders,
      ...?headers,
    };
  }
}
