import Sequelize, { Model } from 'sequelize';

class Category extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
        questions_count: Sequelize.INTEGER,
      },
      {
        sequelize,
      }
    );

    // this.addHook('beforeSave', async (category) => {});

    return this;
  }
}

export default Category;
