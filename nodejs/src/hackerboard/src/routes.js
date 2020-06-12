import { Router } from 'express';
import SignupController from './app/controllers/SignupController';
import SessionController from './app/controllers/SessionController';
import UsersController from './app/controllers/UsersController';
import QuestionsController from './app/controllers/QuestionsController';

import authMiddlewares from './app/middlewares/auth';

const routes = new Router();

routes.post('/signup', SignupController.create);
routes.post('/sessions', SessionController.create);

routes.use(authMiddlewares);

routes.put('/users', UsersController.update);

routes.get('/questions', QuestionsController.list);
routes.post('/questions', QuestionsController.create);

export default routes;
