import * as Yup from 'yup';

import Category from '../models/Category';
import Question from '../models/Question';
import User from '../models/User';

class QuestionsController {
  async create(req, res) {
    const schema = Yup.object().shape({
      title: Yup.string().required(),
      content: Yup.string().required(),
      category_id: Yup.number().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails' });
    }

    const { title, content, category_id } = req.body;

    const category = await Category.findByPk(category_id);
    if (!category) {
      return res
        .status(400)
        .json({ error: 'You can only create question with category' });
    }

    const question = await Question.create({
      title,
      content,
      user_id: req.userId,
      category_id,
    });

    return res.json(question);
  }

  async list(req, res) {
    const { page = 1 } = req.query;

    const questions = await Question.findAll({
      limit: 20,
      offset: (page - 1) * 20,
      include: [
        {
          model: User,
          attributes: {
            include: ['id', 'email', 'name'],
            exclude: ['password_digest', 'createdAt', 'updatedAt'],
          },
        },
      ],
    });
    // const questions = await Question.findAll({ include: { all: true }});
    // const questions = await Question.findAll({ include: User });

    // https://sequelize.org/master/manual/eager-loading.html
    // console.log(await questions[0].getUser());

    return res.json(questions);
  }
}

export default new QuestionsController();
