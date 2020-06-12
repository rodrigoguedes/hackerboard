import * as Yup from 'yup';

import User from '../models/User';
import Queue from '../../lib/Queue';
import WelcomeMail from '../jobs/WelcomeMail';
// import Mail from '../../lib/Mail';

class SignupController {
  async create(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      email: Yup.string().email().required(),
      password: Yup.string().required().min(6),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails' });
    }

    // TODO: Validar to user not send just field valid (only: name, email and password and not password_digest)
    const userExists = await User.findOne({ where: { email: req.body.email } });
    if (userExists) {
      return res.status(400).json({ error: 'User already exists.' });
    }

    const { id, name, email } = await User.create(req.body);

    await Queue.add(WelcomeMail.key, {
      name,
      email
    });

    return res.json({
      id,
      name,
      email,
    });

    // Example case use validade inside of Model
    // try {
    //   const user = await User.create(req.body);
    //   return res.json(user);
    // } catch (error) {
    //   console.log(error.errors[0].message);
    // }
    // return res.status(200).json({ message: 'ok' });
  }
}

export default new SignupController();
