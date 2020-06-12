import Mail from '../../lib/Mail';

class WelcomeMail {
  get key() {
    return 'WelcomeMail';
  }

  async handle({ data }) {
    const { user, email } = data;

    await Mail.sendMail({
      to: `${name} <${email}>`,
      subject: 'Welcome',
      template: 'welcome',
      context: {
        name,
        email,
        home_url: `http://${process.env.APP_URL}/`,
        login_url: `http://${process.env.APP_URL}/login`
      }
    });
  }
}

export default new WelcomeMail();
