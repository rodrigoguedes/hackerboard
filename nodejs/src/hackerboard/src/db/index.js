import Sequelize from 'sequelize';

import User from '../app/models/User';
import Category from '../app/models/Category';
import Question from '../app/models/Question';
import Reply from '../app/models/Reply';

import databaseConfig from '../config/database';

const models = [User, Category, Question, Reply];

class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);

    models.map((model) => model.init(this.connection));
    models.map(
      (model) => model.associate && model.associate(this.connection.models)
    );
  }
}

export default new Database();
