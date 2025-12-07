class CertificateModel {
  final String title;
  final String description;
  final String credentialUrl;
  final String language;
  final String framework;
  final String issuer; // Novo
  final String date; // Novo

  const CertificateModel({
    required this.title,
    required this.description,
    required this.credentialUrl,
    required this.language,
    required this.framework,
    required this.issuer,
    required this.date,
  });

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    return CertificateModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      credentialUrl: map['credential_url'] ?? '',
      language: map['language'] ?? '',
      framework: map['framework'] ?? '',
      // Mapeando os novos campos do banco
      issuer: map['issuer'] ?? '',
      date:
          map['date_issued'] ?? '', // Note que no banco chamei de 'date_issued'
    );
  }
}
