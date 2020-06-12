export default {
  host: process.env.MAIL_HOST,
  port: process.env.MAIL_PORT,
  secure: false,
  auth: {
    user: process.env.MAIL_USER,
    pass: process.env.MAIL_PASS,
  },
  default: {
    from: 'noreply@hackerboard.io',
  },
};
// STMP fake
// mailcatcher
// https://jamhall.github.io/capto/
