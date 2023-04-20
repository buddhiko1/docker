module.exports = function(env) {
  return {
    HOST: "0.0.0.0",
    PORT: 9000,

    DB_CLIENT: "pg",
    DB_HOST: "postgres",
    DB_PORT: 5432,
    DB_USER: "admin",
    DB_DATABASE: "pali",
    DB_PASSWORD_FILE: "/run/secrets/passwd.txt",

    // CACHE_ENABLED: true,
    // CACHE_STORE: "redis",
    // CACHE_REDIS: "redis://cache:6379",

    ADMIN_EMAIL_FILE: "/run/secrets/email.txt",
    ADMIN_PASSWORD_FILE: "/run/secrets/passwd.txt",

    EMAIL_TRANSPORT: "smtp",
    EMAIL_FROM_FILE: "/run/secrets/email.txt",
    EMAIL_SMTP_HOST: "smtp-mail.outlook.com",
    EMAIL_SMTP_PORT: 587,
    EMAIL_SMTP_USER_FILE: "/run/secrets/email.txt",
    EMAIL_SMTP_PASSWORD_FILE: "/run/secrets/passwd.txt",
    EMAIL_SMTP_SECURE: false,
    EMAIL_SMTP_TLS_CIPHERS: "SSLv3",

    PUBLIC_URL: "http://localhost:9000",

    KEY: "255d861b-5ea1-5996-9aa3-922530ec40b1",
    SECRET: "6116487b-cda1-52c2-b5b5-c8022c45e263",
  };
};
