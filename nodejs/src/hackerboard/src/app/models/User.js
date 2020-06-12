import Sequelize, { Model } from 'sequelize';
import bcrypt from 'bcryptjs';

class User extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
        email: Sequelize.STRING,
        // email: {
        //   type: Sequelize.STRING,
        //   validate: {
        //     isUnique: async (email, done) => {
        //       User.findOne({ where: { email } }).done((user, err) => {
        //         if (err) {
        //           done(err);
        //         }
        //         if (user) {
        //           done(new Error('Email already in use'));
        //         }
        //         done();
        //       });
        //     },
        //   },
        // },
        password: Sequelize.VIRTUAL,
        password_digest: Sequelize.STRING,
      },
      {
        sequelize,
      }
    );

    this.addHook('beforeSave', async (user) => {
      if (user.password) {
        // TODO: Add a salt, because if two user fill the same password the hash will be equals
        user.password_digest = await bcrypt.hash(user.password, 8);
      }
    });

    return this;
  }

  checkPassword(password) {
    return bcrypt.compare(password, this.password_digest);
  }
}

export default User;
