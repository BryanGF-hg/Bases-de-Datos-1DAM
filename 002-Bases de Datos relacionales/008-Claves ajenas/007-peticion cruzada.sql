SELECT*FROM email
LEFT JOIN personas
ON email.persona = personas.Identificador;
