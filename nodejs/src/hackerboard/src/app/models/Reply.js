import Sequelize, { Model } from 'sequelize';

class Reply extends Model {
  static init(sequelize) {
    super.init(
      {
        content: Sequelize.STRING,
      },
      {
        sequelize,
      }
    );

    // this.addHook('beforeSave', async (reply) => {});

    return this;
  }

  static associate(models) {
    this.belongsTo(models.User, { foreignKey: 'user_id' });
    this.belongsTo(models.Question, { foreignKey: 'question_id' });
  }
}

export default Reply;
