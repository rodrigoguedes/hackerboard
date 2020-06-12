import Sequelize, { Model } from 'sequelize';

class Question extends Model {
  static init(sequelize) {
    super.init(
      {
        title: Sequelize.STRING,
        content: Sequelize.STRING,
        hits_count: Sequelize.INTEGER,
        reply_at: Sequelize.DATE,
        replies_count: Sequelize.INTEGER,
      },
      {
        sequelize,
      }
    );

    // this.addHook('beforeSave', async (question) => {});

    return this;
  }

  static associate(models) {
    this.belongsTo(models.User, { foreignKey: 'user_id' });
    this.belongsTo(models.Category, { foreignKey: 'category_id' });
    this.hasMany(models.Reply, { foreignKey: 'question_id' });
  }
}

export default Question;
