require('dotenv/config');

module.exports = {
  dialect: 'postgres',
  host: process.env.DB_HOST,
  port: '5432',
  username: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  define: {
    timestamps: true,
    underscored: true,
    underscoredAll: true,
  },
};

// module.exports = {
//   development: {
//     dialect: 'postgres',
//     host: '127.0.0.1',
//     port: '5432',
//     username: 'developer',
//     password: 'dev123',
//     database: 'hackerboard_nodejs',
//     define: {
//       timestamps: true,
//       underscored: true,
//       underscoredAll: true,
//     },
//   },
//   test: {
//     dialect: 'postgres',
//     host: '127.0.0.1',
//     port: '5432',
//     username: 'developer',
//     password: 'dev123',
//     database: 'hackerboard_nodejs',
//     define: {
//       timestamps: true,
//       underscored: true,
//       underscoredAll: true,
//     },
//   },
//   production: {
//     dialect: 'postgres',
//     host: '127.0.0.1',
//     port: '5432',
//     username: 'developer',
//     password: 'dev123',
//     database: 'hackerboard_nodejs',
//     define: {
//       timestamps: true,
//       underscored: true,
//       underscoredAll: true,
//     },
//   },
// };
